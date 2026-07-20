---
name: pyright-lsp
description: This skill should be used when the user asks to "type check python code", "run pyright", "check types", "find type errors", or when reviewing/writing Python files in a project that uses pyright for static type checking (and basedpyright is not in use).
version: 1.0.0
---

# pyright Type Checker

Runs static type checking on Python code using pyright, Microsoft's static type checker for Python.

## When This Skill Applies

- User asks to type check Python code or run pyright
- After writing/editing Python files in a repo with a `[tool.pyright]` section in `pyproject.toml`, a `pyrightconfig.json`, or existing pyright usage (CI config, pre-commit config)
- User asks to find type errors in `.py` files
- Prefer `basedpyright` over `pyright` if the project has `[tool.basedpyright]` config or the `basedpyright-lsp` skill/plugin is installed — use pyright only as fallback when basedpyright isn't the project's chosen tool.

## Detecting pyright Usage

Check for any of:
- `[tool.pyright]` in `pyproject.toml`
- `pyrightconfig.json` at repo root
- `pyright` in `requirements*.txt`, `pyproject.toml` dev deps, or `.pre-commit-config.yaml`

## Running pyright

Type check a file or directory:

```bash
pyright path/to/file.py
pyright .
```

Watch mode (re-check on file change):

```bash
pyright --watch
```

pyright reads config from `pyrightconfig.json` or `[tool.pyright]` in `pyproject.toml` automatically (strict mode, include/exclude, python version). Don't override those settings with flags unless the user asks.

## Installation

```bash
npm install -g pyright
# or
pip install pyright
# or
pipx install pyright
```

## More Information
- [pyright documentation](https://microsoft.github.io/pyright/)
- [GitHub Repository](https://github.com/microsoft/pyright)
