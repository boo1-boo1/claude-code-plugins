---
description: Format Python code with Black
argument-hint: "[path]"
---

Format Python code using Black. Invoke the `black-formatter` skill for the full procedure (config detection, install fallback, check-vs-write behavior).

Target: `$ARGUMENTS` (default to the whole project if no path given).

Steps:
1. Detect Black usage/config (`[tool.black]` in `pyproject.toml`, `.pre-commit-config.yaml`, etc).
2. Run `black $ARGUMENTS` (or `black .` if no argument), respecting existing config — don't override with flags unless asked.
3. Report which files changed.
