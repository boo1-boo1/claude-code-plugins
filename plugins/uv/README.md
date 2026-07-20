# uv

Python packaging and dependency management with uv, Astral's fast Rust-based package/project manager, for Claude Code.

## Usage

```
/uv-deps add requests
/uv-deps sync --frozen
/uv-deps run pytest
```

Or just ask Claude to add/remove a dependency, sync the environment, or run something in the venv — the skill auto-triggers in projects with `uv.lock` or `[tool.uv]`.

## Installation

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Or with pip/pipx:

```bash
pip install uv
pipx install uv
```

## More Information
- [uv documentation](https://docs.astral.sh/uv/)
- [GitHub Repository](https://github.com/astral-sh/uv)
