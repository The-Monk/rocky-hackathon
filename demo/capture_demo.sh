#!/usr/bin/env bash
# ============================================================================
# capture_demo.sh — record run_demo.sh executing FOR REAL, as a screen capture.
# ============================================================================
# The hackathon spec asks for "the actual operation process ... from command
# line to the final result". So this is a genuine X11 screen capture of a real
# xterm running the real script against the real GPU — not a rendered mock-up
# and not a replay of stored text.
#
# Records on Xvfb :99 so it never touches the physical desktop (and so GPU1,
# which drives Xorg, is left alone). Compute runs on GPU0 via the demo script.
#
# Usage: ./capture_demo.sh [out.mp4]
#   PACE=3 ./capture_demo.sh     # slower step pacing -> longer video
# ============================================================================
set -uo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
SCRIPT="${SEGMENT:-$HERE/run_demo.sh}"
OUT="${1:-$HERE/self-narrated/demo-operation.mp4}"
VDISP="${VDISP:-:99}"
W=1920; H=1080
PACE="${PACE:-3}"
RAW="/tmp/demo-capture-raw-$$.mkv"

command -v ffmpeg  >/dev/null || { echo "need ffmpeg";  exit 1; }
command -v xterm   >/dev/null || { echo "need xterm";   exit 1; }

# Xvfb on VDISP must exist; start one if not.
OWN_XVFB=0
if ! DISPLAY="$VDISP" xdpyinfo >/dev/null 2>&1; then
  command -v Xvfb >/dev/null || { echo "need Xvfb (or an existing $VDISP)"; exit 1; }
  echo "[*] starting Xvfb on $VDISP"
  Xvfb "$VDISP" -ac -screen 0 ${W}x$((H+120))x24 +extension RANDR >/dev/null 2>&1 &
  OWN_XVFB=$!; sleep 2
fi
echo "[*] display $VDISP ready: $(DISPLAY=$VDISP xdpyinfo 2>/dev/null | grep -m1 dimensions | tr -s ' ')"

cleanup(){
  [ -n "${FFPID:-}" ] && kill "$FFPID" 2>/dev/null
  [ -n "${XTPID:-}" ] && kill "$XTPID" 2>/dev/null
  [ "$OWN_XVFB" != 0 ] && kill "$OWN_XVFB" 2>/dev/null
  return 0
}
trap cleanup EXIT INT TERM

echo "[*] starting capture -> $RAW"
ffmpeg -y -loglevel error -f x11grab -framerate 25 -video_size ${W}x${H} \
       -i "${VDISP}.0+0,0" -c:v libx264 -preset ultrafast -qp 0 "$RAW" &
FFPID=$!
sleep 2

echo "[*] launching xterm running $(basename "$SCRIPT") (PACE=$PACE POST=${POST:-$PACE})"
DISPLAY="$VDISP" xterm \
  -geometry 142x43+0+0 \
  -fa 'DejaVu Sans Mono' -fs 19 \
  -bg '#0b0e12' -fg '#d6dae2' \
  -xrm 'xterm*colorBD: #ffffff' \
  -title 'hyperloom — autonomous kernel optimization on AMD Radeon' \
  -e bash -lc "PACE=$PACE POST=${POST:-$PACE} TYPE=${TYPE:-0.022} '$SCRIPT'; echo; echo '  [segment complete]'; sleep 3" &
XTPID=$!

wait "$XTPID" 2>/dev/null
echo "[*] demo finished; stopping capture"
sleep 1
kill -INT "$FFPID" 2>/dev/null
wait "$FFPID" 2>/dev/null

echo "[*] transcoding to delivery mp4"
ffmpeg -y -loglevel error -i "$RAW" \
       -c:v libx264 -crf 20 -preset slow -pix_fmt yuv420p -r 25 \
       -movflags +faststart "$OUT"
rm -f "$RAW"
echo "[*] wrote $OUT"
ffprobe -v error -show_entries format=duration,size -show_entries stream=width,height \
        -of default=nw=1 "$OUT" | sed 's/^/    /'
