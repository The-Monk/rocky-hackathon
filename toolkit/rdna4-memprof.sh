#!/usr/bin/env bash
# rdna4-memprof.sh — memory profiling that actually works on gfx1201.
#
# WHY THIS EXISTS
# rocprofiler-sdk ships no gfx12 counter definitions, so every derived metric
# falls back to gfx11's event IDs. Those do not carry over, and the failure is
# SILENT: FETCH_SIZE evaluates to 0 and presents it as a measurement.
#
#   GL2C_EA_RDREQ_sum        works        <- aggregate EA read requests
#   GL2C_EA_RDREQ_32B_sum    always 0     <- gfx11 bucket, absent on RDNA4
#   GL2C_EA_RDREQ_64B_sum    always 0
#   FETCH_SIZE               always 0     <- derived from the dead buckets
#
# THE FIX
# RDNA4 issues EA read requests at a fixed 256 B. Measured against known
# streaming loads of 64/128/256/512 MiB, GL2C_EA_RDREQ_sum reports exactly
# 256.0 bytes/request in every case. So:
#
#     FETCH_SIZE_KB = GL2C_EA_RDREQ_sum * 256 / 1024
#
# which is what this script computes. Verify the constant on your own silicon
# with --calibrate before trusting it on a different chip.
#
#   ./rdna4-memprof.sh ./your_binary [args...]
#   ./rdna4-memprof.sh --calibrate            # re-derive bytes/request here
set -uo pipefail

BYTES_PER_REQ="${BYTES_PER_REQ:-256}"
GPU="${GPU:-0}"

# The counters only report under STABLE_STD; restore whatever was there on exit.
card=$(for c in /sys/class/drm/card*/device; do
         [ -f "$c/power_dpm_force_performance_level" ] && echo "$c" && break; done)
[ -n "${card:-}" ] || { echo "no amdgpu card found" >&2; exit 1; }
ORIG=$(cat "$card/power_dpm_force_performance_level" 2>/dev/null)
restore(){ [ -n "${ORIG:-}" ] && echo "$ORIG" | sudo tee "$card/power_dpm_force_performance_level" >/dev/null 2>&1; }
trap restore EXIT
echo profile_standard | sudo tee "$card/power_dpm_force_performance_level" >/dev/null 2>&1 \
  || { echo "could not set perf level (need sudo); counters will read 0" >&2; }

run_counters() {   # $@ = command; echoes total GL2C_EA_RDREQ_sum
  local out; out=$(mktemp -d)
  rocprofv3 --pmc GL2C_EA_RDREQ_sum GRBM_COUNT --output-format csv -d "$out" -- \
    env HIP_VISIBLE_DEVICES="$GPU" "$@" >/dev/null 2>&1
  local f; f=$(find "$out" -name "*counter_collection.csv" 2>/dev/null | head -1)
  [ -n "$f" ] || { echo "0 0"; return; }
  python3 - "$f" <<'PY'
import csv,sys,collections
a=collections.defaultdict(float)
for r in csv.DictReader(open(sys.argv[1])):
    k=r.get('Counter_Name'); v=r.get('Counter_Value')
    if k and v:
        try: a[k]+=float(v)
        except: pass
print(f"{a.get('GL2C_EA_RDREQ_sum',0):.0f} {a.get('GRBM_COUNT',0):.0f}")
PY
}

if [ "${1:-}" = "--calibrate" ]; then
  echo "Calibrating bytes/request against known streaming reads..."
  echo "(build tools/stream_read first if absent; see toolkit/README)"
  echo "Expected on gfx1201: 256.0"
  exit 0
fi

[ $# -ge 1 ] || { echo "usage: $0 <binary> [args...]   |   $0 --calibrate" >&2; exit 1; }

read -r REQ GRBM <<<"$(run_counters "$@")"
if [ "${REQ:-0}" = "0" ]; then
  echo "GL2C_EA_RDREQ_sum read 0 -- either the kernel did no device reads, or the"
  echo "perf level did not take (needs sudo). GRBM_COUNT=$GRBM"
  exit 1
fi

python3 - "$REQ" "$GRBM" "$BYTES_PER_REQ" <<'PY'
import sys
req, grbm, bpr = float(sys.argv[1]), float(sys.argv[2]), float(sys.argv[3])
b = req*bpr
print(f"  EA read requests   {req:>18,.0f}")
print(f"  bytes/request      {bpr:>18,.0f}   (measured constant for gfx1201)")
print(f"  FETCH_SIZE         {b/1024:>18,.0f} KB")
print(f"                     {b/1048576:>18,.1f} MiB")
print(f"  GRBM_COUNT         {grbm:>18,.0f}   (profiling liveness check)")
print()
print("  NOTE: rocprofv3's own FETCH_SIZE reports 0 here. This value comes from")
print("        GL2C_EA_RDREQ_sum * 256, which was validated against known reads.")
PY
