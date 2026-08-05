#!/usr/bin/env bash
# Rocky ISA-verification lever: compile a HIP/C++ kernel and show the ACTUAL emitted
# AMDGPU ISA for a given arch, so you can VERIFY which instruction a matmul/dot/loop
# resolves to (catches compiler fallbacks) instead of asserting it. Also surfaces
# exact target-feature gates (e.g. gfx1201: __builtin_amdgcn_sdot4 -> "needs feature
# dot1-insts" => RDNA4 int-dot is a DIFFERENT instruction, not classic dp4a).
#
# Usage:
#   disasm-gfx.sh kernel.hip [gfx1201] [grep-regex]
#   disasm-gfx.sh kernel.hip gfx1201 'v_wmma|v_dot|v_swmmac|v_dual'
#
# Companion: llvm-mc (assemble hand-written ISA the auto-packer won't emit, e.g. VOPD
# V_DOT2C dual-issue bundles) and llvm-objdump (disassemble a prebuilt .co/.hsaco).
# NOTE: the AMD-blog gfx90a/amdphdrs/Code-Object-v1 recipe is STALE — current ROCm is
# COv5 via lld; use --save-temps (below) or clang-offload-bundler --unbundle, not amdphdrs.
set -euo pipefail
SRC="${1:?usage: disasm-gfx.sh kernel.hip [arch] [grep-regex]}"
ARCH="${2:-gfx1201}"
RE="${3:-v_wmma|v_swmmac|v_dot[0-9]|v_dual|v_pk_|v_fma|global_load_b|ds_[a-z]+_b|s_endpgm}"

# Resolve the SDK toolchain (TheRock 7.14 pip SDK in qat714, or system ROCm).
# Locate the ROCm/LLVM toolchain. Try the explicit override, then the standard
# install, then a pip/conda ROCm SDK. FAIL LOUDLY if none has the assembler --
# a silent empty result is indistinguishable from "the instruction is absent",
# which is exactly the wrong answer to give a tool that exists to establish truth.
find_sdk() {
    local c
    for c in "${ROCM_PATH:-}" /opt/rocm /usr/lib/rocm \
             "$HOME"/miniconda3/envs/*/lib/python*/site-packages/_rocm_sdk_devel \
             "$HOME"/.local/lib/python*/site-packages/_rocm_sdk_devel; do
        [ -n "$c" ] && [ -x "$c/lib/llvm/bin/llvm-mc" ] && { echo "$c"; return 0; }
        [ -n "$c" ] && [ -x "$c/llvm/bin/llvm-mc" ]     && { echo "$c"; return 0; }
    done
    echo "ERROR: no ROCm toolchain with llvm-mc found. Set ROCM_PATH." >&2
    return 1
}
SDK="$(find_sdk)" || exit 3
HIPCC="$SDK/bin/hipcc"; [ -x "$HIPCC" ] || HIPCC="$(command -v hipcc)"

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
cp "$SRC" "$TMP/k.hip"
echo ">> compiling $SRC for $ARCH (feature-gate errors below are DIAGNOSTIC, not noise):"
"$HIPCC" --offload-arch="$ARCH" -O3 --save-temps -c -o "$TMP/k.o" "$TMP/k.hip" 2>&1 \
    | grep -iE 'error|needs target feature|note' || true
S="$(ls "$TMP"/*"$ARCH"*.s 2>/dev/null | head -1 || true)"
[ -n "$S" ] || { echo "!! no device ISA emitted (compile failed — see feature gate above)"; exit 1; }
echo ">> emitted $ARCH ISA (filtered: $RE):"
grep -iE "$RE" "$S" | sed 's/^[[:space:]]*//' | sort | uniq -c | sort -rn | head -25
echo ">> full ISA saved alongside via --save-temps in the build dir if you need the schedule."
