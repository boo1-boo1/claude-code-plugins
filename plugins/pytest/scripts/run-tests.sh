#!/usr/bin/env bash
set -euo pipefail

HOOK_INPUT="$(cat)"
FILE_PATH="$(python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input', {}).get('file_path', ''))" <<<"$HOOK_INPUT")"

[[ "$FILE_PATH" == *.py ]] || exit 0

cd "${CLAUDE_PROJECT_DIR:-.}"

command -v pytest >/dev/null 2>&1 || exit 0

is_pytest_project() {
  grep -qE '^\[tool\.pytest\.ini_options\]' pyproject.toml 2>/dev/null && return 0
  [[ -f pytest.ini ]] && return 0
  grep -qE '^\[tool:pytest\]' setup.cfg 2>/dev/null && return 0
  find . -maxdepth 4 -name conftest.py -print -quit 2>/dev/null | grep -q . && return 0
  return 1
}

is_pytest_project || exit 0

BASENAME="$(basename "$FILE_PATH")"
if [[ "$BASENAME" == test_*.py || "$BASENAME" == *_test.py ]]; then
  TARGET="$FILE_PATH"
else
  TARGET="."
fi

pytest "$TARGET" -q
