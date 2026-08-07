# [Issue] FETCH_SIZE and all derived memory metrics silently return 0 on gfx1201 (RDNA4) — root cause and proposed expression

## Summary

`FETCH_SIZE` returns **0** on gfx1201 for a workload that provably reads
hundreds of MiB — a wrong answer presented as a measurement rather than an
error.

Two facts are established. First, `rocprofiler-sdk` ships **no `gfx12` section**
in `basic_counters.xml` or `derived_counters.xml` (verified against
`ROCm/rocm-systems` `develop`), yet counter names still resolve for gfx1201 —
via a fallback path we could not identify. Second, **EA read requests on this
chip measure 256 B**, established by a falsification test using a stride smaller
than the request itself, so `FETCH_SIZE`'s constituent 32/64/96/128 B buckets
reporting zero may be *correct behaviour* rather than breakage.

We deliberately do **not** claim to know which. Distinguishing "buckets absent",
"buckets remapped to other event IDs" and "buckets correctly reporting zero"
requires the gfx12 event tables, which are not public — and that is what this
report asks for.

This is distinct from, and not fixed by, the perf-level requirement documented in
rocm-systems#7455 (which closed rocm-systems#5953). That documentation is
correct and necessary — everything below was measured **with**
`STABLE_STD` set — but it is not sufficient.

## Environment

| | |
|---|---|
| GPU | AMD Radeon AI PRO R9700, gfx1201 (RDNA4) |
| ROCm | 7.14 |
| rocprofv3 | 1.3.2 |
| GPU perf level | `profile_standard` (STABLE_STD) for every measurement below |

## Reproducer

`fetch_size_repro.hip` (attached) streams an exact, known number of bytes from
device memory in a single launch, with a working set far larger than any cache,
so the expected DRAM read traffic is independent of the profiler.

```bash
hipcc --offload-arch=gfx1201 -O3 fetch_size_repro.hip -o fetch_size_repro
sudo amd-smi set --gpu 0 --perf-level STABLE_STD
rocprofv3 --pmc FETCH_SIZE GL2C_EA_RDREQ_sum GL2C_EA_RDREQ_32B_sum \
          GL2C_EA_RDREQ_64B_sum GRBM_COUNT \
          --output-format csv -d out -- ./fetch_size_repro
```

## Observed — 256 MiB streamed, one launch, same run

```
FETCH_SIZE                       0     <-- expected ~262,144 KB
GL2C_EA_RDREQ_32B_sum            0
GL2C_EA_RDREQ_64B_sum            0
GL2C_EA_RDREQ_sum        1,048,586     <-- non-zero
GRBM_COUNT               4,679,361     <-- profiling is demonstrably active
```

`GRBM_COUNT` and `GL2C_EA_RDREQ_sum` reporting real values in the same run rules
out "profiling was not enabled" as an explanation.

## The 256 B request size, measured at four points

| streamed | `GL2C_EA_RDREQ_sum` | bytes/request |
|---|---|---|
| 64 MiB | 262,148 | **256.0** |
| 128 MiB | 524,292 | **256.0** |
| 256 MiB | 1,048,586 | **256.0** |
| 512 MiB | 2,097,162 | **256.0** |

No drift across an 8x range.

**Falsification test.** Streaming alone cannot distinguish "256 B requests" from
"the counter tracks lines touched". A second test uses a stride *smaller* than
the putative request, so the hypotheses diverge: 1,048,576 elements read at a
128 B stride gives 524,298 requests, against 524,288 predicted for a 256 B
request and 1,048,576 for a 128 B request (ratios 1.000 and 0.500). Reproducer:
`falsification_probe.hip`.

**Unverified premise.** The event identity behind `GL2C_EA_RDREQ_sum` on gfx1201
is unknown — with no gfx12 definitions, the name resolves via a fallback we could
not locate. The arithmetic is self-consistent across five access patterns, but
that is evidence about behaviour, not confirmation of which hardware event is
being read.

## An important caveat on the "dead buckets" reading

An earlier draft of this report called the zero-valued `GL2C_EA_RDREQ_32B_sum` /
`_64B_sum` evidence that the buckets are *absent* on RDNA4. That claim
contradicts the rest of the report and is withdrawn.

If EA requests really are a fixed 256 B, then a workload issuing only 256 B
requests **should** report zero 32 B and 64 B requests — that is correct
behaviour, not breakage. The two observations cannot both be used as evidence.

What remains defensible is narrower:

* `FETCH_SIZE` evaluates to 0 for a workload that provably reads hundreds of MiB.
  Whatever the cause, that is a wrong answer presented as a measurement.
* There is no `gfx12` section in either counter XML, so whatever resolves these
  names for gfx1201 is a fallback path we could not identify.
* The 32B/64B buckets may be absent, may be remapped to different event IDs, or
  may be correctly reporting zero. **We cannot distinguish these without the
  gfx12 event tables**, which is precisely what this report asks for.

## Why the derived metric collapses

gfx11 defines:

```
FETCH_SIZE = (GL2C_EA_RDREQ_32B_sum*32 + GL2C_EA_RDREQ_64B_sum*64
            + GL2C_EA_RDREQ_96B_sum*96 + GL2C_EA_RDREQ_128B_sum*128) / 1024
```

Every term is zero on gfx1201, so the sum is zero. Any metric on gfx11's
derived list that depends on those buckets fails the same way.

## Proposed expression for a `gfx12` block

```xml
<metric name="FETCH_SIZE"
        expr=(GL2C_EA_RDREQ_sum*256)/1024
        descr="The total kilobytes fetched from video memory."/>
```

Validated against the table above: this returns 262,147 KB for a known 256.0 MiB
read (0.001% over, consistent with a handful of driver-side requests).

## Scope and what I cannot confirm

- The 256 B constant is measured **on gfx1201 only**. I have no gfx1200 or
  gfx1250 hardware and cannot confirm it generalises across gfx12.
- I cannot rule out that RDNA4 exposes size-bucketed requests under **different
  event IDs**. The RDNA4 ISA guide (doc 70651) documents `PERF_SNAPSHOT_DATA/1/2`,
  a `DISABLE_PERF` wave-mode bit and a `perf_snapshot` trap, but contains no
  perfmon block or event tables, and the encodings appear to be resolved inside
  `libhsa-amd-aqlprofile64.so`. If those events do exist, publishing their IDs
  would be preferable to the aggregate-based expression above.
- `WRITE_SIZE` presumably needs the same treatment via `GL2C_EA_WRREQ_*`; I have
  not calibrated the write path.

## Secondary request: fail loudly rather than returning zero

Independent of the fix, a counter that is undefined for the current
architecture should be an **error**, not `0`. A zero is indistinguishable from a
real measurement of no traffic, and it is actively misleading: we spent a day
treating a dead counter as evidence of a memory-bound kernel behaving oddly. An
"unsupported on this architecture" diagnostic would have cost seconds.

This also matters for how rocm-systems#5953 was closed. The perf-level
documentation is correct, but a reader who applies it still gets zeros from
`FETCH_SIZE`, with nothing to indicate the remaining problem is different.

## Note for RDNA4 users reading this

PC sampling **does** work on gfx1201 and gives per-instruction attribution, but
it is gated behind an environment variable that the failure message does not
suggest:

```bash
ROCPROFILER_PC_SAMPLING_BETA_ENABLED=ON rocprofv3 \
  --pc-sampling-method host_trap --pc-sampling-unit time \
  --pc-sampling-interval 1000 --output-format csv -d out -- ./binary
```

On an fp8 GEMV this yielded 4,539 samples attributing 61.3% to
`v_dot4_f32_fp8_fp8` and 9.5% to `global_load_b128` — the answer the counters
were meant to provide. Documenting this as the recommended path on RDNA4 would
help, given the counter situation above.
