# Reproducing the numbers

All benchmarks run on an AMD Radeon GPU on ROCm (validated on Radeon AI PRO R9700, gfx1201). Each kernel **correctness-gates against a CPU reference before it reports any throughput** — a fast-but-wrong kernel exits non-zero. Set `HIP_VISIBLE_DEVICES` to a non-display GPU; do not set `ROCR_VISIBLE_DEVICES` (it silently forces CPU fallback).

## 1. Decode — int4 dot8 vs dp4a (1.49×)

Self-contained. Same int4-weight GEMV, two compute routes; both must match the CPU int reference exactly.

```bash
cd kernels/decode
hipcc --offload-arch=gfx1201 -O3 decode_dp4a.hip -o decode_dp4a
hipcc --offload-arch=gfx1201 -O3 decode_dot8.hip -o decode_dot8
HIP_VISIBLE_DEVICES=0 ./decode_dp4a     # correctness=PASS, ~250 us, 116 GB/s
HIP_VISIBLE_DEVICES=0 ./decode_dot8     # correctness=PASS, ~168 us, 173 GB/s  => 1.49x
```
Or drive it through AMD's Magpie evaluator: `../toolkit/magpie.sh compare -k compare_decode.yaml` (correctness ranking) + `metrix profile` for the gfx1201 duration (see `toolkit/magpie.sh` header for the RDNA4 metrix recipe).

## 2. Prefill — int4 2:4-sparse K64 SWMMAC full GEMM (3.67×)

The SWMMAC per-lane layout helpers live in the roc9 llama.cpp fork (`swmmac24_iu4_k64.cuh`). To keep this repo self-contained, the standalone bench and the required layout header are bundled here as `gemm_bench.hip` + `swmmac24_iu4_k64.cuh` (see PACKAGING note below).

```bash
cd kernels/prefill
hipcc --offload-arch=gfx1201 -O3 -DRDNA4 gemm_bench.hip -o gemm_bench
HIP_VISIBLE_DEVICES=0 ./gemm_bench       # correctness err=0 for all shapes, then the K sweep
```
Expected (M=N=4096, ILP=4): K=8192 → int4-K64-SWMMAC 50.5 TOPS vs int8-K16-WMMA 13.7 TOPS = **3.67×** (88–95% of the register-resident raw-instruction ceiling of 3.90×). Capture grows with K as fixed overhead amortizes.

> Note: `-DRDNA4` is required — the SWMMAC/WMMA intrinsics are gated behind `#if defined(RDNA4)`; without it every matrix op silently falls to a zero-returning stub (a bug the correctness gate caught during development).

## 3. Comms — INT6 compressed all-reduce (numpy reference)

The exact-reduce property and the accuracy curve are validated in numpy (CPU, no GPU needed); the HIP two-shot kernel is provided for the GPU stage.

```bash
cd kernels/allreduce
python test_accuracy.py        # exact-reduce drift ~5e-7 (shared scale); INT6 vs INT4 vs INT8 curve
python test_weight_quant.py    # INT6 vs MXFP6 as a weight-quant format, on real tensors
```
See `DESIGN.md` for the two-shot NUMA-aware structure and the GPU-window benchmark plan.

---

## PACKAGING (pre-submission checklist)
- [ ] Bundle `swmmac24_iu4_k64.cuh` (+ its `swmmac24.cuh` deps) into `kernels/prefill/` so the GEMM bench builds with no external tree. (Currently references the roc9 fork.)
- [ ] Pin exact ROCm/hipcc versions in this README.
- [ ] Record the demo (see `../demo/`).
