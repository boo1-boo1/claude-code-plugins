# pytest

Python testing with pytest for Claude Code — runs the suite respecting the project's existing conventions, and can auto-run tests after file edits.

## Usage

```
/python-test
/python-test tests/test_foo.py
/python-test -m "not slow"
```

Or just ask Claude to run tests / check coverage — the skill auto-triggers in projects with pytest config or `conftest.py`.

## Test-runner hook

Ships a `PostToolUse` hook (`hooks/hooks.json` → `scripts/run-tests.sh`) that fires after every `Write`/`Edit` tool call:

- Skips non-`.py` files and skips if the project isn't pytest-based (no `[tool.pytest.ini_options]`/`pytest.ini`/`[tool:pytest]`/`conftest.py`) or `pytest` isn't installed.
- If the edited file is a test file (`test_*.py` / `*_test.py`), runs just that file.
- Otherwise runs the full suite (`pytest . -q`).
- Failures surface as non-blocking output — Claude sees the result but the edit itself isn't blocked.

Requires `bash` and `python3` (used to parse the hook's JSON input) on `PATH`.

## Installation

```bash
pip install pytest
# or
pipx install pytest
```

## More Information
- [pytest documentation](https://docs.pytest.org/)
- [GitHub Repository](https://github.com/pytest-dev/pytest)
