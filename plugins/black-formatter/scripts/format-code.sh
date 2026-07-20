#!/usr/bin/env bash
set -euo pipefail

HOOK_INPUT="$(cat)"
FILE_PATH="$(python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input', {}).get('file_path', ''))" <<<"$HOOK_INPUT")"

[[ "$FILE_PATH" == *.py ]] || exit 0
[[ -f "$FILE_PATH" ]] || exit 0

cd "${CLAUDE_PROJECT_DIR:-.}"

command -v black >/dev/null 2>&1 || exit 0

is_black_project() {
  grep -qE '^\[tool\.black\]' pyproject.toml 2>/dev/null && return 0
  grep -q 'psf/black' .pre-commit-config.yaml 2>/dev/null && return 0
  return 1
}

is_black_project || exit 0

black --quiet "$FILE_PATH"
