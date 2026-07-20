---
description: Manage Python dependencies/environment with uv
argument-hint: "<add|remove|sync|lock|run> [args]"
---

Manage Python dependencies/environment using uv. Invoke the `uv` skill for the full procedure (usage detection, conventions).

Args: `$ARGUMENTS` — first token is the subcommand (`add`, `remove`, `sync`, `lock`, `run`), rest are passed through.

Steps:
1. Detect uv usage (`uv.lock`, `[tool.uv]` in `pyproject.toml`). If a competing `poetry.lock`/`[tool.poetry]` also exists, stop and ask which tool is authoritative.
2. Parse `$ARGUMENTS` for subcommand + remaining args.
3. Run `uv <subcommand> <args>` (e.g. `uv add requests`, `uv sync --frozen`, `uv run pytest`).
4. Report the result (deps changed, lockfile updated, command output).
