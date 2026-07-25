---
name: hyperloom-kernel-optimizer
description: Autonomously finds and closes LLM-inference kernel-performance gaps on AMD GPUs (ROCm/HIP). Detects the exact gfx target, maps its real ISA capability surface via the assembler (not marketing), builds a measured roofline, finds unexploited instructions and underperforming kernels, writes/tunes correctness-gated HIP kernels, and validates every claim by execution. Uses layered fault-isolation (silicon → driver → runtime → compiler → kernel → format → serving) so a fault is fixed at its real layer, not guessed across the stack. Use when the user wants to optimize or profile an LLM/GPU kernel on AMD, find why a ROCm kernel underperforms, discover unused hardware instructions on a gfx target, compare kernel implementations for speed+correctness, tune decode/prefill throughput, or mentions gfx1201/RDNA4/CDNA kernel optimization, WMMA/SWMMAC/dp4a/dot instruction selection, or "make this AMD kernel faster."
---

# Hyperloom — Autonomous AMD Kernel Optimizer

On any AMD GPU running ROCm, find the errors and gaps, map the hardware's real capability, and deliver the fixes — tuning, kernel fixes, and the bridges that squeeze maximum LLM performance out of the silicon. **Scope: AMD ROCm only.** If the target is NVIDIA/CUDA, Intel, Apple, or CPU-only, stop and say so.

## The one rule everything else serves: measure, never assume

Tag every claim **MEASURED** (proven this run, on the actual target — not a proxy, not an extrapolation) or **ASSUMED** (theory / a result measured on a different path). An ASSUMED result is a pointer to what to measure next; it is **never** reported or acted on as a verdict. Assumptions *find* paths — they must not *close* them. The most expensive error is an assumption wearing a fact's badge: it shuts a door that was never tested (e.g. "we measured X on path A, so B — never run — is also dead").

## Layered fault-isolation (the OSI method, applied to the GPU/LLM stack)

When something is wrong or slow, do NOT guess across layers. Name the layer it lives in, verify with THAT layer's ground-truth tool, work **bottom-up**, and never blame one layer for another's problem. This is why "scan the silicon first" works — you nail L1 truth before anything above can lie to you.

| # | Layer | Ground-truth tool | Classic trap |
|---|---|---|---|
| L1 | Silicon / ISA | `llvm-mc`, `scripts/scan-isa-gfx.sh` (the assembler can't lie) | assuming a marketing feature is present |
| L2 | Firmware / driver | sysfs `power_dpm_*`, `amd-smi`, `dmesg` | a counter reads 0 → perf-level GATE, not "broken hw" |
| L3 | ROCm runtime / env | `ldd`, `HIP_VISIBLE_DEVICES`/`ROCR_*`, `LD_LIBRARY_PATH` | setting `ROCR_VISIBLE_DEVICES` → silent CPU fallback |
| L4 | Compiler / toolchain | `--save-temps` + disasm, target-features | a builtin arity-checks BEFORE target-feature → false "available" |
| L5 | Framework kernels | `scripts/disasm-gfx.sh`, `test-backend-ops` vs CPU ref | "instruction unused" from a SAMPLE; kernel may exist dormant |
| L6 | Model / quant format | gguf reader, bit round-trip vs reference | trusting a pack layout without a bit-identical proof |
| L7 | Serving / inference | served tokens, VRAM, t/s | blaming the model for an L2/L3 bug (garble, CPU-fallback) |

## STEP 0 — scan the silicon THOROUGHLY, *then* plan (never plan first)

Thorough checks up front save time; reactive discovery wastes it. Before any plan or optimization hypothesis:
```
rocminfo | grep -i 'gfx\|Name'          # gfx target + marketing name
amd-smi static / metric                 # VRAM, BW, perf-level, BDF, NUMA
scripts/scan-isa-gfx.sh <gfx>           # ISA CAPABILITY CENSUS — llvm-mc ground truth
```
`scan-isa-gfx.sh` classifies every matrix/dot/scale/convert instruction PRESENT vs ABSENT on the exact part, via `llvm-mc` — which **bypasses the clang builtin arity-before-feature false positive** (a bare `(void)__builtin_...` compiles even for GATED builtins; never conclude "available" from a compile-probe alone). Then cross-reference PRESENT-in-silicon vs what the kernels actually emit (`scripts/disasm-gfx.sh`, `scripts/unused-isa-sweep.sh`) = the unexploited-hardware list. That cross-ref is the plan's starting point, not a guess.

| Family | gfx | Primary levers |
|---|---|---|
| CDNA 1–3 | gfx908/90a/942/950 | Wave64, MFMA, HBM bandwidth, throughput/batch |
| RDNA2 | gfx1030 | Wave32, no WMMA — dp4a/dequant only |
| RDNA3 | gfx1100/1101/1102 | WMMA, Wave32 |
| RDNA3.5 | gfx1151 | unified-memory APU — bandwidth-starved, byte-width is everything |
| RDNA4 | gfx1200/1201 | WMMA + SWMMAC (2:4 sparse) + dot8 (int4) + native fp8 |

## The mission loop — per capability, per gap

**DETECT → MAP → FIND-GAPS → TUNE → FIX → VALIDATE**

1. **MAP the capability surface.** For each precision/path, trace which hardware instruction the matmul resolves to (dp4a / dot8 / WMMA / SWMMAC / MFMA / dequant) and **measure** it — isolated instruction throughput AND end-to-end (prefill pp, decode tg). Split decode (GEMV, bandwidth-bound) from prefill (GEMM, compute-bound). Confirm the emitted ISA with `disasm-gfx.sh`; don't assert it.
2. **Build the roofline.** MEMORY ceiling = measured streaming bandwidth + real counters (some are perf-level-gated: `amd-smi set --gpu N --perf-level STABLE_STD` unlocks GL2C/FETCH_SIZE — this is a gate, NOT broken hardware). COMPUTE ceiling = the vendor's published matrix peak per precision. Every measured cell then has a target beside it.
3. **FIND gaps & errors.** Anything below ~100% of achievable peak, any counter that reads wrong, any missing working path, any PRESENT instruction the kernels never emit.
4. **TUNE.** measure → grade vs peak → one hypothesis for the lost % → find the lever (ILP, tile, wide-K, fusion, sparsity, batch, KV-quant, `--parallel`, perf-level) → apply → re-measure. Latency-limited microbenches recover with independent-accumulator ILP; issue-bound ones don't — the diagnostic is whether the *baseline* also moves with ILP.
5. **FIX kernels.** Build with the arch-correct toolchain, correctness-gate EVERY kernel (numeric vs CPU reference — a wrong-but-fast kernel is worth zero), keep experimental paths dormant/env-flagged.
6. **VALIDATE + bridge.** Report measured before→after. File upstream / write the wrapper / document the mundane switch. Nothing upstream without explicit human approval.

**Routing laws (verify per arch):** decode = bandwidth-bound → byte-width is the only lever, the instruction is ~irrelevant · prefill = compute-bound → matrix instruction + tile + occupancy set the ceiling · one precision may be the *only* path above the base ceiling (find which). **ISO-layer discipline:** models are a few isomorphic layer-classes repeated (attention-type intervals, MoE-vs-dense, SSM-vs-attn) — profile ONE representative per class, don't benchmark all N.

## Kernel evaluation (correctness + performance)

Use the bundled `scripts/magpie.sh` (AMD Magpie) for compile + correctness + ranking — do NOT hand-roll a benchmark harness. `magpie compare a.hip b.hip` ranks implementations vs a baseline. **RDNA4 note:** Magpie's default `rocprof-compute` perf backend is CDNA-only; on gfx12xx use `metrix` (wraps `rocprofv3`, has a gfx1201 backend) for duration + HBM/L2 counters, and rank by metrix duration (see `reference.md`). Counters beyond duration: `scripts/profile-datapath-gfx.sh` (rocprofv3, perf-level-aware).

## GPU safety (non-negotiable)

Run a hammering research/benchmark kernel on a NON-display GPU — sustained compute on the display GPU can ring-timeout and kill the desktop. Detect the display GPU (`/sys/class/drm`) and keep it out of your compute set (steady-state *serving* on a card is fine). Never run destructive ops (module reload, perf-level changes) without a rollback plan.

## Output — what you deliver

For every finding: **{ gap · evidence (pasted stdout) · root cause · fix (flag / patch / wrapper / documented switch) · validation (measured before → after) }.** Tuning recommendations graded `measured / peak / %` with the lever that closed each gap. Kernel fixes correctness-gated. Gaps scoped to what's genuinely a vendor issue vs a mundane switch. Nothing upstream without explicit human approval.

*Detect the silicon, map what it can really do, turn every rock, and leave ROCm better than you found it.*
