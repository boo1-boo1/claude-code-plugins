---
name: ruff-linter
description: This skill should be used when the user asks to "lint python code", "run ruff", "check with ruff", "fix lint errors", or when reviewing/writing Python files in a project that uses Ruff for linting.
version: 1.0.0
---

# Ruff Linter

Lints Python code using Ruff, an extremely fast Python linter and code fixer.

## When This Skill Applies

- User asks to lint Python code or run Ruff
- After writing/editing Python files in a repo with a `[tool.ruff]` section in `pyproject.toml`, a `ruff.toml`/`.ruff.toml`, or existing Ruff usage (CI config, pre-commit config)
- User asks to find or fix lint errors in `.py` files

## Detecting Ruff Usage

Check for any of:
- `[tool.ruff]` in `pyproject.toml`
- `ruff.toml` or `.ruff.toml` at repo root
- `ruff` in `requirements*.txt`, `pyproject.toml` dev deps, or `.pre-commit-config.yaml`

## Running Ruff

Lint a file or directory:

```bash
ruff check path/to/file.py
ruff check .
```

Auto-fix safe issues:

```bash
ruff check --fix path/to/file.py
```

Ruff reads config from `pyproject.toml`/`ruff.toml` automatically (rule selection, line-length, excludes). Don't override those settings with flags unless the user asks.

Ruff can also format (Black-compatible), if the project prefers a single tool:

```bash
ruff format path/to/file.py
```

## Recommended Configuration

If Ruff is used but no `[tool.ruff]` section exists yet, offer (don't auto-apply) this baseline as a starting point — confirm with the user before writing it:

```toml
[tool.ruff]
target-version = "py<repo's minimum supported version>"
line-length = 100
preview = true

[tool.ruff.lint]
select = [
  "ASYNC", # async best practices
  "B",     # flake8-bugbear
  "C4",    # flake8-comprehensions
  "D",     # pydocstyle
  "DOC",   # pydoclint
  "E",     # pycodestyle errors
  "F",     # pyflakes
  "G",     # flake8-logging-format
  "I",     # isort
  "N",     # pep8-naming
  "PERF",  # performance anti-patterns
  "RUF",   # ruff-specific rules
  "SIM",   # flake8-simplify
  "UP",    # pyupgrade
  "W",     # pycodestyle warnings
]
ignore = [
  "E501", # line length handled by black
  "D203", # conflicts with D211
  "D213", # conflicts with D212
]
```

Match `line-length` to whatever Black is configured with in the same repo (see black-formatter skill) — both must agree or Ruff and Black will fight over line breaks.

## Installation

```bash
pip install ruff
# or
pipx install ruff
```

## More Information
- [Ruff documentation](https://docs.astral.sh/ruff/)
- [GitHub Repository](https://github.com/astral-sh/ruff)
