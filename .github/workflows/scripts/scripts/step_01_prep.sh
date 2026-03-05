#!/usr/bin/env bash
set -euo pipefail
CONFIG="${1:-configs/pipeline.yaml}"

echo "[prep] using ${CONFIG}"
mkdir -p results
echo "prep ok" > results/prep.done
