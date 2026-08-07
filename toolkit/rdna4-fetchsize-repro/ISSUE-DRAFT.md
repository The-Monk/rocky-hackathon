# [Issue] FETCH_SIZE and all derived memory metrics silently return 0 on gfx1201 (RDNA4) — root cause and proposed expression

## Summary

`rocprofiler-sdk` ships no `gfx12` section in `basic_counters.xml` or
`derived_counters.xml`. Counter names still resolve — they fall through to the
gfx11 definitions — but the gfx11 event IDs do not describe RDNA4, so the
derived metrics evaluate to **0 and report that as a measurement** rather than
failing.

Root cause, measured: **RDNA4 issues EA read requests at a fixed 256 B**, so the
32/64/96/128 B request buckets that gfx11's `FETCH_SIZE` is built from do not
exist on this hardware and always read zero.

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

No drift across an 8x range. The aggregate counter is accurate; only the
size-bucketed variants are absent.

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
