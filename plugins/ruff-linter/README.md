# ruff-linter

Python linting and code quality checks with Ruff for Claude Code.

## Usage

```
/python-lint [path] [--fix]
```

Or just ask Claude to lint Python code — the skill auto-triggers.

## Fix-on-edit hook

Ships a `PostToolUse` hook (`hooks/hooks.json` → `scripts/fix-lint.sh`) that fires after every `Write`/`Edit` on a `.py` file:

- Skips if `ruff` isn't installed, or the project has no `[tool.ruff]` in `pyproject.toml`, no `ruff.toml`/`.ruff.toml`, and no `astral-sh/ruff` entry in `.pre-commit-config.yaml`.
- Runs `ruff check --fix --quiet` on just the edited file (safe fixes only, no `--unsafe-fixes`).

Requires `bash` and `python3` (used to parse the hook's JSON input) on `PATH`.

## Installation

```bash
pip install ruff
# or
pipx install ruff
```

## More Information
- [Ruff documentation](https://docs.astral.sh/ruff/)
- [GitHub Repository](https://github.com/astral-sh/ruff)
