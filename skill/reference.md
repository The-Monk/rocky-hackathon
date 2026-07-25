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
Sets the compute GPU to `profile_standard` (STABLE_STD) so the memory counters read, then runs `rocprofv3` with a working gfx1201 counter set (GL2C_EA_RDREQ/WRREQ, FETCH_SIZE, GL2C_HIT, GRBM/SQ/TA). Restores AUTO on exit. Use the SDK-matched `rocprofv3` (version skew vs the app runtime segfaults). rocprof-compute/Omniperf are CDNA-only — do not use on RDNA4.

## gfx1201 (RDNA4) instruction cheat-sheet (llvm-mc-verified PRESENT)
Matrix: `v_wmma_f32_16x16x16_{f16,bf16,fp8,bf8}`, `v_wmma_i32_16x16x{16_iu8,32_iu4}`, `v_swmmac_f32_16x16x32_fp8`, `v_swmmac_i32_16x16x64_iu4`. Dot: `v_dot8_i32_iu4`, `v_dot4_i32_iu8`, `v_dot4_f32_fp8`, `v_dot2_f32_f16`. GATED/ABSENT (do not chase): `v_dot2c_f32_f16` (dual-issue), all `v_cvt_scalef32_*` scale-units (gfx950/1250-only). Builtins: `__builtin_amdgcn_sudot8` → `v_dot8_i32_iu4`; `__builtin_amdgcn_sudot4` → `v_dot4_i32_iu8`; `__builtin_amdgcn_swmmac_i32_16x16x64_iu4_w32`.

## Environment traps
- `ROCR_VISIBLE_DEVICES` overrides `HIP_VISIBLE_DEVICES`; setting it (even empty) can force silent CPU fallback. Pin with `HIP_VISIBLE_DEVICES` and leave `ROCR` unset.
- ROCm = two decoupled layers: kernel `amdgpu-dkms` (own version) vs userspace SDK (pip/TheRock — don't assume `/opt/rocm-X`). `ldconfig` may resolve an old shadow — LD-force the right libs.
