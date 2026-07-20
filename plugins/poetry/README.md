# poetry

Python packaging and dependency management with Poetry, for Claude Code.

## Usage

```
/poetry-deps add requests
/poetry-deps install --sync
/poetry-deps run pytest
```

Or just ask Claude to add/remove a dependency, install the environment, or run something in the venv — the skill auto-triggers in projects with `poetry.lock` or `[tool.poetry]`.

## Installation

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

Or with pipx:

```bash
pipx install poetry
```

## More Information
- [Poetry documentation](https://python-poetry.org/docs/)
- [GitHub Repository](https://github.com/python-poetry/poetry)
