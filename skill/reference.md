# Reference — toolkit + hard-won gfx-specific switches

All scripts are in `scripts/`. They are arch-generic (pass the gfx target); the notes below are what they solved so you don't lose a week to the same wall.

## scripts/scan-isa-gfx.sh `<gfx>`  — Step-0 ISA capability census (L1 ground truth)
`llvm-mc`-based PRESENT/ABSENT classification of every matrix/dot/scale/convert instruction. The assembler cannot lie. **Bypasses the clang builtin arity-before-target-feature false positive** — a bare `(void)__builtin_amdgcn_...` compiles even for a GATED builtin, so a compile-probe is NOT proof of availability; `llvm-mc` assembling the mnemonic for the arch IS.

## scripts/disasm-gfx.sh `<kernel.hip> [gfx] [regex]`  — verify emitted ISA (L4/L5)
Compiles with `hipcc --offload-arch=<gfx> --save-temps` and shows the real device ISA — so you VERIFY which instruction a matmul resolves to instead of asserting it (catches silent compiler fallbacks). NB: the common gfx90a/`amdphdrs`/Code-Object-v1 recipe is stale — modern ROCm is COv5 via lld; use `--save-temps` / `clang-offload-bundler --unbundle`.

## scripts/unused-isa-sweep.sh `<build_dir> [gfx]`  — the reverse audit
Recompiles every compute kernel in a build with `--save-temps` and cross-references emitted ISA against the PRESENT census → the definitive "in silicon, 0 uses" list. Reliable per-kernel recompile via `compile_commands.json`; do NOT trust `roc-obj`/.so unbundle for this (flaky). Grep the `.s` directly for mnemonics — the `.s` IS the human-readable ISA (do not run `llvm-objdump` on a `.s`).

## scripts/magpie.sh `<analyze|compare> ...`  — kernel evaluation (AMD Magpie)
Compile + correctness + rank implementations vs a baseline. USE THIS instead of hand-rolling a bench harness. **RDNA4 closed-loop recipe:**
- Perf backend = `metrix` (NOT the default `rocprof-compute`, which is CDNA-only/dead on gfx12xx). metrix has a `gfx1201` backend and wraps `rocprofv3` → duration + HBM BW util + L2 hit.
  `pip install "metrix @ git+https://github.com/AMDResearch/intellikit.git@<sha>#subdirectory=metrix"`
- One-time gotcha: the SDK `rocprofv3` shebang is `#!/usr/bin/env python3`; if it resolves to a python without pyyaml, `metrix` fails `No module named 'yaml'` → `<that-python> -m pip install --no-user pyyaml`.
- `magpie compare` correctness works on gfx1201; its auto-winner scoring weights CDNA `MFMA_FLOPs` (=0 on RDNA4), so **rank by metrix duration**, not the auto-winner label: `metrix profile --profile quick -- ./binary | grep -oE 'avg=[0-9.]+'` and mean the dispatches. (Tracking: AMD-AGI/Magpie#70.)

## scripts/profile-datapath-gfx.sh `<app...>`  — rocprofv3 counters (perf-level-aware)
Sets the compute GPU to **`profile_peak`** (NOT `profile_standard`) so the memory counters un-gate, then runs `rocprofv3` with a working gfx1201 counter set (GL2C_EA_RDREQ/WRREQ, FETCH_SIZE, GL2C_HIT, GRBM/SQ/TA). Restores AUTO on exit. **Why `profile_peak`:** the counter gating (rocm-systems#5953) unlocks under *any* fixed DPM profile — but `profile_standard`/STABLE_STD throttles the GPU to ~1593 MHz (vs ~2472 boost), silently suppressing any benchmark run alongside it; `profile_peak` un-gates the same counters at *peak* clocks (verified: GL2C_EA_RDREQ_sum 0→1.32M @ 2332 MHz). Use the SDK-matched `rocprofv3` (version skew vs the app runtime segfaults). rocprof-compute/Omniperf are CDNA-only — do not use on RDNA4. **General rule: bench at perf-level=auto; only ever use a fixed profile for counter collection, and restore auto after.**

## gfx1201 (RDNA4) instruction cheat-sheet (llvm-mc-verified PRESENT)
Matrix: `v_wmma_f32_16x16x16_{f16,bf16,fp8,bf8}`, `v_wmma_i32_16x16x{16_iu8,32_iu4}`, `v_swmmac_f32_16x16x32_fp8`, `v_swmmac_i32_16x16x64_iu4`. Dot: `v_dot8_i32_iu4`, `v_dot4_i32_iu8`, `v_dot4_f32_fp8`, `v_dot2_f32_f16`. GATED/ABSENT (do not chase): `v_dot2c_f32_f16` (dual-issue), all `v_cvt_scalef32_*` scale-units (gfx950/1250-only). Builtins: `__builtin_amdgcn_sudot8` → `v_dot8_i32_iu4`; `__builtin_amdgcn_sudot4` → `v_dot4_i32_iu8`; `__builtin_amdgcn_swmmac_i32_16x16x64_iu4_w32`.

## Whole-substrate levers — detect the part, reach for what it actually has
The HIP toolkit above targets the GPU rows; the assembler-ground-truth discipline is the same everywhere, but the lever changes with the silicon. Never apply a gfx1201 conclusion to a part that has different units.

**CDNA GPU (gfx908/90a/942 — MI100/MI250/MI300):** Wave64 + **MFMA** (`v_mfma_*`), NOT WMMA — a WMMA-shaped kernel won't emit anything here. Throughput/batch-oriented (huge HBM), not batch-1 latency. Profiler: rocprof-compute/Omniperf DO work here (the opposite of RDNA4). Runtime lever = vLLM/SGLang tensor-parallel.

**CDNA4 gfx950 (MI350) + RDNA-next gfx1250:** the **native-MX** parts. `v_cvt_scalef32_*` scale-convert units + MX-WMMA (MXFP4/6/8 with hardware block-scale) + fp4-cvt are PRESENT here — **exactly the mnemonics `scan-isa-gfx.sh` reports GATED/ABSENT on gfx1201.** The arch check must FLIP: on gfx1201 MX is convert-only/software (pack in ggml, ride the fp8 dot path); on gfx950/gfx1250 it's a native matrix+scale lever. Re-run the ISA census per-part before assuming a lever ports.

**Zen CPU (znver3/4/5 — EPYC · Threadripper · Ryzen):** matmul lever is **AVX-512-VNNI** int8 (`vpdpbusd`) + AVX-512-BF16 on Zen4/5; Zen3 is AVX2-only (lower int8 throughput). Framework = **zentorch** (AMD torch backend) or **vLLM-CPU**. Bandwidth+SIMD-bound → single-socket pinning (`numactl --cpunodebind=0 --membind=0`; vLLM scales poorly across sockets). Threadripper/TR-PRO = the many-core + quad/octa-channel tier (higher throughput than desktop Ryzen, single-socket so no cross-socket penalty). Ref: `amd/skills serving-llms-on-epyc`.

**Ryzen AI NPU (XDNA1/2 — Phoenix→Strix):** int8/int4 on the **AIE** tiled array (~10–16 TOPS XDNA1, ~50 TOPS XDNA2). No HIP — path is **Ryzen AI SW / ONNX-Runtime / Lemonade**; quantize to the NPU's supported types. Power-efficient decode offload, not a GEMM firehose.

**APU (Strix Halo / Strix Point / Phoenix — CPU+iGPU+NPU, one chip):** the distinguishing lever is **unified memory** (up to 128 GB LPDDR5X, zero-copy between engines → big models fit, no PCIe hand-off) + **hybrid partition** (NPU = power-efficient decode, iGPU = parallel prefill via the gfx WMMA path, CPU = orchestration/overflow). The wall is *shared* LPDDR bandwidth → byte-width is everything: aggressive int4/mxfp quant + spec-decode. Decompose the APU into its `engines[]` (e.g. Strix Halo = znver5 + gfx1151 iGPU + xdna2 NPU) and apply each engine's row above; **Lemonade** auto-routes across them.

## Environment traps
- `ROCR_VISIBLE_DEVICES` overrides `HIP_VISIBLE_DEVICES`; setting it (even empty) can force silent CPU fallback. Pin with `HIP_VISIBLE_DEVICES` and leave `ROCR` unset.
- ROCm = two decoupled layers: kernel `amdgpu-dkms` (own version) vs userspace SDK (pip/TheRock — don't assume `/opt/rocm-X`). `ldconfig` may resolve an old shadow — LD-force the right libs.
