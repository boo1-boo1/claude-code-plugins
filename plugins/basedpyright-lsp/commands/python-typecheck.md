---
description: Type check Python code with basedpyright
argument-hint: "[path]"
---

Type check Python code using basedpyright. Invoke the `basedpyright-lsp` skill for the full procedure (config detection, install fallback).

Target: `$ARGUMENTS` (default to the whole project if no path given).

Steps:
1. Detect basedpyright/pyright usage/config (`[tool.basedpyright]`/`[tool.pyright]` in `pyproject.toml`, `pyrightconfig.json`, `basedpyright` in `requirements*.txt`, `pyproject.toml` dev deps, or `.pre-commit-config.yaml`).
2. Run `basedpyright $ARGUMENTS` (or `basedpyright .` if no argument), respecting existing config — don't override with flags unless asked.
3. Report type errors found.
