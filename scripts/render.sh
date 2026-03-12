#!/bin/bash
# ═══════════════════════════════════════════════════════════
# render.sh — HTML → PDF via Puppeteer (preferred) or Chromium
# Usage: render.sh <input.html> [output.pdf]
#
# Uses Puppeteer (Node.js) which properly waits for JS execution
# (ECharts, Chart.js, fonts) before generating the PDF.
# Falls back to raw Chromium if Puppeteer is not available.
# ═══════════════════════════════════════════════════════════
set -euo pipefail

INPUT="${1:?Usage: render.sh <input.html> [output.pdf]}"
OUTPUT="${2:-${INPUT%.html}.pdf}"

# Resolve to absolute paths
INPUT="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"
if [ -d "$(dirname "$OUTPUT")" ]; then
  OUTPUT="$(cd "$(dirname "$OUTPUT")" && pwd)/$(basename "$OUTPUT")"
else
  OUTPUT="$(pwd)/$(basename "$OUTPUT")"
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Rendering: $(basename "$INPUT") → $(basename "$OUTPUT")"

# Try Puppeteer first (handles JS-heavy content like ECharts)
if command -v node &>/dev/null; then
  NODE_PATH="$(npm root -g 2>/dev/null)" node "$SCRIPT_DIR/render-pdf.js" "$INPUT" "$OUTPUT"
  exit $?
fi

# Fallback: raw Chromium (works for static HTML, not for ECharts)
echo "WARNING: Puppeteer not available. Using raw Chromium (JS-heavy content may not render)."
CHROMIUM=""
for cmd in chromium chromium-browser google-chrome google-chrome-stable; do
  if command -v "$cmd" &>/dev/null; then
    CHROMIUM="$cmd"
    break
  fi
done

if [ -z "$CHROMIUM" ]; then
  echo "ERROR: No Chromium/Chrome binary found." >&2
  exit 1
fi

EXTRA_FLAGS=""
if grep -q "echarts\|chart\.js\|Chart(" "$INPUT" 2>/dev/null; then
  EXTRA_FLAGS="--virtual-time-budget=10000 --run-all-compositor-stages-before-draw"
fi

"$CHROMIUM" --headless --disable-gpu --no-sandbox --disable-dev-shm-usage \
  --print-to-pdf="$OUTPUT" --print-to-pdf-no-header --no-pdf-header-footer \
  $EXTRA_FLAGS "file://$INPUT" 2>/dev/null

# Validate
if [ ! -f "$OUTPUT" ]; then echo "ERROR: PDF was not created." >&2; exit 1; fi
SIZE=$(stat -c%s "$OUTPUT" 2>/dev/null || stat -f%z "$OUTPUT" 2>/dev/null)
if [ "$SIZE" -lt 1000 ]; then echo "ERROR: PDF is suspiciously small." >&2; exit 1; fi
KB=$((SIZE / 1024))
echo "✓ PDF created: $(basename "$OUTPUT") (${KB}KB)"
