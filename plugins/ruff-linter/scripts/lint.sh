#!/usr/bin/env bash
set -euo pipefail

HOOK_INPUT="$(cat)"
FILE_PATH="$(python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input', {}).get('file_path', ''))" <<<"$HOOK_INPUT")"

[[ "$FILE_PATH" == *.py ]] || exit 0
[[ -f "$FILE_PATH" ]] || exit 0

cd "${CLAUDE_PROJECT_DIR:-.}"

command -v ruff >/dev/null 2>&1 || exit 0

is_ruff_project() {
  grep -qE '^\[tool\.ruff\]' pyproject.toml 2>/dev/null && return 0
  [[ -f ruff.toml || -f .ruff.toml ]] && return 0
  grep -q 'astral-sh/ruff' .pre-commit-config.yaml 2>/dev/null && return 0
  return 1
}

is_ruff_project || exit 0

ruff check --quiet "$FILE_PATH"
