#!/usr/bin/env bash
set -euo pipefail
if [ -z "${GHIDRA_INSTALL_DIR:-}" ]; then
  echo "Set GHIDRA_INSTALL_DIR first, e.g.: export GHIDRA_INSTALL_DIR=/path/to/ghidra_11.1.2_PUBLIC"
  exit 1
fi
gradle -PGHIDRA_INSTALL_DIR="$GHIDRA_INSTALL_DIR" buildExtension
