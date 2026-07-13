---
description: Lint Python code with Ruff (add --fix to autofix)
argument-hint: "[path] [--fix]"
---

Lint Python code using Ruff. Invoke the `ruff-linter` skill for the full procedure (config detection, install fallback, fix behavior).

Args: `$ARGUMENTS` — may include a path and/or `--fix`.

Steps:
1. Detect Ruff usage/config (`[tool.ruff]` in `pyproject.toml`, `ruff.toml`/`.ruff.toml`, `.pre-commit-config.yaml`).
2. Parse `$ARGUMENTS`: extract path (default `.` if none given) and check for `--fix`.
3. Run `ruff check <path>` if no `--fix`, or `ruff check --fix <path>` if `--fix` given. Respect existing config — don't override with extra flags unless asked.
4. Report findings (or files fixed, if `--fix` used).
