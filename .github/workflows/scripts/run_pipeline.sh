#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/pipeline.yaml}"
TARGET="${2:-}"

echo "[run_pipeline] config=${CONFIG}"
echo "[run_pipeline] target=${TARGET}"

# Make dirs predictable for artifacts
mkdir -p logs results work

# ---- EDIT THIS SECTION: the one place where your pipeline is defined ----
# Replace the example commands with your actual pipeline steps.

# Example: call a python runner (if you have one)
# python -m pipeline.cli "${CONFIG}" ${TARGET:+--target "${TARGET}"}

# Example: Snakemake
# snakemake --cores 2 --configfile "${CONFIG}" ${TARGET:+ "${TARGET}"}

# Example: Nextflow
# nextflow run main.nf -params-file "${CONFIG}"

# Example: pure bash stepchain
bash scripts/step_01_prep.sh   "${CONFIG}" |& tee "logs/step_01_prep.log"
bash scripts/step_02_align.sh  "${CONFIG}" |& tee "logs/step_02_align.log"
bash scripts/step_03_mods.sh   "${CONFIG}" |& tee "logs/step_03_mods.log"
bash scripts/step_04_report.sh "${CONFIG}" |& tee "logs/step_04_report.log"

echo "[run_pipeline] done"
