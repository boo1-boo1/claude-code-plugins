---
name: basedpyright-lsp
description: This skill should be used when the user asks to "type check python code", "run basedpyright", "check types", "find type errors", or when reviewing/writing Python files in a project that uses basedpyright/pyright for static type checking.
version: 1.0.0
---

# basedpyright Type Checker

Runs static type checking on Python code using basedpyright, a fork of Pyright with stricter defaults and additional features.

## When This Skill Applies

- User asks to type check Python code or run basedpyright
- After writing/editing Python files in a repo with a `[tool.basedpyright]` or `[tool.pyright]` section in `pyproject.toml`, a `pyrightconfig.json`, or existing basedpyright/pyright usage (CI config, pre-commit config)
- User asks to find type errors in `.py` files

## Detecting basedpyright Usage

Check for any of:
- `[tool.basedpyright]` or `[tool.pyright]` in `pyproject.toml`
- `pyrightconfig.json` at repo root
- `basedpyright` in `requirements*.txt`, `pyproject.toml` dev deps, or `.pre-commit-config.yaml`

## Running basedpyright

Type check a file or directory:

```bash
basedpyright path/to/file.py
basedpyright .
```

Watch mode (re-check on file change):

```bash
basedpyright --watch
```

basedpyright reads config from `pyrightconfig.json` or `[tool.basedpyright]`/`[tool.pyright]` in `pyproject.toml` automatically (strict mode, include/exclude, python version). Don't override those settings with flags unless the user asks.

## Recommended Configuration

basedpyright's defaults are stricter than plain pyright even at basic/standard tiers, and can be noisy on typical projects. If basedpyright is used but no `[tool.basedpyright]` section exists yet, offer (don't auto-apply) this baseline — confirm with the user before writing it:

```toml
[tool.basedpyright]
include = ["src"]
exclude = ["**/__pycache__"]
typeCheckingMode = "standard"
reportMissingTypeStubs = "none"
```

`typeCheckingMode = "standard"` and `reportMissingTypeStubs = "none"` dial back basedpyright's stricter-than-pyright-standard defaults. Adjust `include` to the repo's actual source directory.

## Installation

```bash
npm install -g basedpyright
# or
pip install basedpyright
# or
pipx install basedpyright
```

## More Information
- [basedpyright on npm](https://www.npmjs.com/package/basedpyright)
- [basedpyright on PyPI](https://pypi.org/project/basedpyright/)
- [GitHub Repository](https://github.com/DetachHead/basedpyright)
