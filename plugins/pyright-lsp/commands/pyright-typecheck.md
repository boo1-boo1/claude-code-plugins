---
description: Type check Python code with pyright
argument-hint: "[path]"
---

Type check Python code using pyright. Invoke the `pyright-lsp` skill for the full procedure (config detection, install fallback).

Target: `$ARGUMENTS` (default to the whole project if no path given).

Steps:
1. Detect pyright usage/config (`[tool.pyright]` in `pyproject.toml`, `pyrightconfig.json`, `pyright` in `requirements*.txt`, `pyproject.toml` dev deps, or `.pre-commit-config.yaml`).
2. Run `pyright $ARGUMENTS` (or `pyright .` if no argument), respecting existing config — don't override with flags unless asked.
3. Report type errors found.
