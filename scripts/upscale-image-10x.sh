#!/usr/bin/env bash
set -euo pipefail

if ! command -v magick >/dev/null 2>&1; then
  echo "Error: ImageMagick is not installed or 'magick' is not on PATH." >&2
  exit 1
fi

input="${1:-\"ChatGPT Image Jul 20, 2026, 11_11_10 AM (1).png\"}"
output="${2:-\"ChatGPT Image Jul 20, 2026, 11_11_10 AM (1)@10x.png\"}"

if [[ ! -f "$input" ]]; then
  echo "Error: Input file not found: $input" >&2
  exit 1
fi

magick "$input" -filter Lanczos -resize 1000% "$output"
echo "Created $output"
