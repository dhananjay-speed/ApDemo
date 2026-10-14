#!/usr/bin/env bash
# Run the feature loop headlessly (uses your existing `claude` CLI login).
# Usage: ./scripts/run-feature.sh "Add biometric unlock to settings"
set -euo pipefail
if [ $# -eq 0 ]; then echo "Usage: $0 \"<feature description>\""; exit 1; fi
claude -p "/feature $*"
