#!/bin/bash
# ═══════════════════════════════════════════════════════════
# generate-image.sh — Generate editorial illustrations via fal.ai
# Usage: generate-image.sh "prompt" [output.jpg] [size]
# Size: landscape | portrait | square | cover (default: landscape)
#   landscape = 1536x1024
#   portrait  = 1024x1536
#   square    = 1024x1024
#   cover     = 1536x2048 (high-res for full-bleed covers)
# ═══════════════════════════════════════════════════════════
set -euo pipefail

PROMPT="${1:?Usage: generate-image.sh \"prompt\" [output.jpg] [size]}"
OUTPUT="${2:-generated-image.jpg}"
SIZE="${3:-landscape}"

# Map friendly names to dimensions
case "$SIZE" in
  landscape)  W=1536; H=1024 ;;
  portrait)   W=1024; H=1536 ;;
  square)     W=1024; H=1024 ;;
  cover)      W=1536; H=2048 ;;
  *)          W=1536; H=1024 ;;
esac

# Style prefix for consistency with our design system
STYLE_PREFIX="Editorial illustration style, warm earth tones, terracotta #B85C38, sand #D4B896, sage #6B7F5E, dark espresso #2C2420 palette, professional, subtle grain texture, no text, no watermarks. "

FULL_PROMPT="${STYLE_PREFIX}${PROMPT}"

echo "Generating (${W}x${H}): ${PROMPT:0:60}..."

RESPONSE=$(curl -s --max-time 90 \
  "https://fal.run.cloudproxy.vibecodeapp.com/fal-ai/flux/dev" \
  -H "Authorization: Key ${FAL_API_KEY}" \
  -H "Content-Type: application/json" \
  -d "$(python3 -c "
import json, sys
print(json.dumps({
    'prompt': sys.argv[1],
    'image_size': {'width': int(sys.argv[2]), 'height': int(sys.argv[3])},
    'num_images': 1,
    'num_inference_steps': 28,
    'guidance_scale': 3.5
}))" "$FULL_PROMPT" "$W" "$H")")

# Extract URL
URL=$(echo "$RESPONSE" | python3 -c "import sys,json; r=json.load(sys.stdin); print(r['images'][0]['url'])" 2>/dev/null)

if [ -z "$URL" ]; then
  echo "ERROR: Image generation failed" >&2
  echo "$RESPONSE" | python3 -c "import sys,json; print(json.dumps(json.load(sys.stdin),indent=2))" 2>/dev/null >&2
  exit 1
fi

# Download
curl -sL "$URL" -o "$OUTPUT"
SIZE_KB=$(( $(stat -c%s "$OUTPUT" 2>/dev/null || stat -f%z "$OUTPUT" 2>/dev/null) / 1024 ))
echo "✓ Image saved: $OUTPUT (${SIZE_KB}KB, ${W}x${H})"
