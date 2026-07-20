---
description: Run Python tests with pytest
argument-hint: "[path|-k expr|-m marker]"
---

Run Python tests using pytest. Invoke the `pytest` skill for the full procedure (config detection, conventions).

Target: `$ARGUMENTS` (default to the whole suite if nothing given — pass through as-is, e.g. a path, `-k` expression, or `-m` marker filter).

Steps:
1. Detect pytest usage/config (`[tool.pytest.ini_options]` in `pyproject.toml`, `pytest.ini`, `setup.cfg`, `conftest.py`).
2. Run `pytest $ARGUMENTS`, respecting existing config (`addopts`, markers, testpaths) — don't add extra flags unless asked.
3. Report pass/fail counts and failure details.
