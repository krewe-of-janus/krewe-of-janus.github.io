#!/usr/bin/env zsh
set -euo pipefail

# Usage: zsh process-history-photo.zsh <input-file> [output-file]
# Resizes so the longest side is <= 1200px.

if (( $# < 1 )); then
  echo "Usage: zsh process-history-photo.zsh <input-file> [output-file]" >&2
  exit 1
fi

input="$1"
output="${2:-$1}"
max=1200

if [[ ! -f "$input" ]]; then
  echo "File not found: $input" >&2
  exit 1
fi

sips --resampleWidth "$max" --resampleHeight "$max" "$input" --out "$output" >/dev/null

echo "Processed: $output"
