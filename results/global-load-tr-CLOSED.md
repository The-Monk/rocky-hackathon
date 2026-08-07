# global_load_tr_b128 / _b64 on gfx1201 — investigated, CLOSED NEGATIVE

**Verdict: do not build.** The instruction is real, well-designed, reachable from
HIP, and has no seam in our stack to plug into.

## What it does (and this part checks out)

ISA §11.6 (doc 70651, ~line 8135) is titled "WMMA Matrix Load Ops with Transpose".
`GLOBAL_LOAD_TR_B128` (16-bit elements) and `_B64` (8-bit) take a per-lane
contiguous 16 B / 8 B run — one K-column segment of a column-major tile — and
scatter it directly into WMMA fragment slots. **No shuffle is needed**; the output
matches the wave32 fragment layout as-is. Constraints: fixed 16×16 dense tile,
EXEC all-ones, plain linear source with 16-element contiguous runs, and
**global/flat address space only** — there is no LDS-side equivalent on RDNA4
(`ds_read_tr` is gfx950/CDNA).

Verified here: both mnemonics assemble for gfx1201, and
`__builtin_amdgcn_global_load_tr_b128_v8f16` compiles.

## Why it still fails for us

1. **The premise was wrong.** We assumed MMQ pays an LDS transpose tax. It does
   not: A-tiles use a contiguous per-lane copy from LDS, B-tiles use
   `load_generic` (with an in-source note that it beats `load_ldmatrix`), and the
   layout conversion is absorbed into the LDS *write* during dequant — work that
   is unavoidable because those elements must be touched anyway. There is no
   read-side transpose to remove.

2. **Quantized paths cannot use it.** TR loads move raw bytes at a fixed stride.
   GGUF blocks interleave scales (2 B per 32 elements for Q8_0, superblock
   structure for Q4_K, nibble packing for int4), which breaks the required
   16-element contiguous runs. Only an already-repacked dense int8/fp8/f16 buffer
   qualifies — and repacking is exactly where our kernels do the layout fix-up
   for free.

3. **Decode is dead on arrival.** At 96–97% of the measured DRAM roofline, an
   instruction that saves LDS traffic and VALU shuffles but not one DRAM byte
   cannot win.

4. **hipBLASLt does not emit it.** All 146 gfx1201 code objects in the shipped
   ROCm 7.14 library were disassembled: zero occurrences. TensileLite models the
   capability but gates it behind DirectToVgpr + TLU + GRVW==8, and our own July
   work found DirectToVgpr fragile on this target (the winning 2:4 tile used
   `TransposeLDS=1`). **Correction to an earlier note: the gfx1201 annotation in
   `Solution.py` is OUR OWN comment from 2026-07-27, not upstream endorsement.**

5. **The one real target is marginal.** `fattn-mma-f16.cuh` does a genuine
   software transpose (`load_ldmatrix_trans`) for the V^T fragment. But `tile_V`
   is staged in LDS and reused across warps, so a TR load means forfeiting that
   reuse and re-reading V from global per warp; it is f16-KV only; and
   fattn-mma is selected on gfx1201 only under narrow conditions. Attention is a
   minority of already-compute-bound prefill.

## Prior art

CK ships it — `ck/utility/amd_transpose_load.hpp`, `__gfx12__`-gated, wired into
`dynamic_buffer.hpp` and ck_tile's `buffer_view.hpp` — so AMD's own gfx12 dense
GEMM pipelines use it. No published gains. Upstream llama.cpp: zero uses.

## If anyone revisits this

The cheap falsification is a **Tensile experiment**, not a hand-written kernel:
generate one GLTr + DirectToVgpr f16 solution for a real prefill shape and bench
it against the tuned dense baseline. A fork kernel is the wrong vehicle.
