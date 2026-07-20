---
description: Manage Python dependencies/environment with Poetry
argument-hint: "<add|remove|install|lock|run> [args]"
---

Manage Python dependencies/environment using Poetry. Invoke the `poetry` skill for the full procedure (usage detection, conventions).

Args: `$ARGUMENTS` — first token is the subcommand (`add`, `remove`, `install`, `lock`, `run`), rest are passed through.

Steps:
1. Detect Poetry usage (`poetry.lock`, `[tool.poetry]` in `pyproject.toml`). If a competing `uv.lock`/`[tool.uv]` also exists, stop and ask which tool is authoritative.
2. Parse `$ARGUMENTS` for subcommand + remaining args.
3. Run `poetry <subcommand> <args>` (e.g. `poetry add requests`, `poetry install --sync`, `poetry run pytest`).
4. Report the result (deps changed, lockfile updated, command output).
