---
name: pytest
description: This skill should be used when the user asks to "run tests", "run pytest", "run the test suite", "check test coverage", or when writing/editing test files in a project that uses pytest.
version: 1.0.0
---

# pytest Test Runner

Runs and writes tests using pytest, respecting the project's existing test conventions instead of guessing.

## When This Skill Applies

- User asks to run tests, run pytest, or check test coverage
- Writing or editing test files (`test_*.py`, `*_test.py`, or files under a `tests/` dir) in a repo that uses pytest
- Before writing new tests, read `conftest.py` and neighboring test files first — most bugs from this skill are duplicated setup or fixtures reinvented because existing ones weren't checked.

## Detecting pytest Usage

Check for any of:
- `[tool.pytest.ini_options]` in `pyproject.toml`
- `pytest.ini` or `setup.cfg` with a `[tool:pytest]` section
- `conftest.py` anywhere in the repo
- `pytest` in `requirements*.txt`, `pyproject.toml` dev deps, or `.pre-commit-config.yaml`

## Before Writing Tests

- Read `conftest.py` (repo root and nearest ancestor to the test file) for existing fixtures — reuse them instead of duplicating setup.
- Check for custom markers registered in `pyproject.toml`/`pytest.ini` (e.g. `slow`, `integration`) and apply them to new tests that fit, so they can be filtered like the rest of the suite.
- Match existing style for repeated cases: if the codebase already uses `@pytest.mark.parametrize`, don't write a manual loop instead.
- Check whether `pytest-asyncio` is configured (`asyncio_mode = "auto"` vs `"strict"` in config) before writing `async def test_...` — under strict mode, missing `@pytest.mark.asyncio` makes the test silently skip instead of fail.

## Running pytest

Run the full suite:

```bash
pytest
```

Run a specific file, test, or by keyword:

```bash
pytest tests/test_foo.py
pytest tests/test_foo.py::test_bar
pytest -k "foo and not slow"
```

Filter by marker:

```bash
pytest -m "not slow"
pytest -m integration
```

Stop on first failure / re-run only last failures:

```bash
pytest -x
pytest --lf
pytest --ff        # failed first, then the rest
```

With coverage (if `pytest-cov` is installed/configured):

```bash
pytest --cov=src --cov-report=term-missing
```

pytest reads config from `pyproject.toml`/`pytest.ini`/`setup.cfg` automatically (markers, testpaths, addopts). Don't override those settings with flags unless the user asks — check `addopts` first, since flags there (like `-ra` or a default `--cov`) already apply on every bare `pytest` invocation.

## Installation

```bash
pip install pytest
# or
pipx install pytest
```

## More Information
- [pytest documentation](https://docs.pytest.org/)
- [GitHub Repository](https://github.com/pytest-dev/pytest)
