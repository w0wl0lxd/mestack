#!/usr/bin/env bash
# Wires scripts/hooks/ up as this repo's git hooks directory. Portable — plain git config, no
# framework dependency (deliberately not using the Python `pre-commit` tool, to keep mestack's
# tooling dependency surface small and consistent with its Rust-first, minimal-dependency goals).
#
# Usage: ./scripts/install-hooks.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

git config core.hooksPath scripts/hooks
chmod +x scripts/hooks/*

echo "Hooks installed (core.hooksPath -> scripts/hooks)."
echo "Requires gitleaks on PATH for the secret/PII guard to run locally; trufflehog is optional."
