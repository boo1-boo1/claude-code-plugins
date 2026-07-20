# python-tooling-plugins

Marketplace of Claude Code plugins.

Repo: https://github.com/boo1-boo1/python-tooling-plugins

## Usage

Add this marketplace in Claude Code:

```
/plugin marketplace add boo1-boo1/python-tooling-plugins
```

Then install a plugin:

```
/plugin install basedpyright-lsp
/plugin install pyright-lsp
/plugin install black-formatter
/plugin install ruff-linter
/plugin install uv
/plugin install poetry
/plugin install pytest
```

## Plugins

**Type checking**

| Plugin | Description | Command |
| --- | --- | --- |
| [basedpyright-lsp](plugins/basedpyright-lsp) | Python language server (basedpyright) for type checking and code intelligence (LSP: `basedpyright-langserver`) | `/python-typecheck [path]` |
| [pyright-lsp](plugins/pyright-lsp) | Python language server (pyright) for type checking and code intelligence (LSP: `pyright-langserver`) | `/pyright-typecheck [path]` |

**Formatting & linting**

| Plugin | Description | Command |
| --- | --- | --- |
| [black-formatter](plugins/black-formatter) | Python code formatting with Black, plus a hook that auto-formats on edit | `/python-format [path]` |
| [ruff-linter](plugins/ruff-linter) | Python linting and code quality checks with Ruff, plus a hook that auto-fixes lint errors on edit | `/python-lint [path] [--fix]` |

**Packaging & dependency management**

| Plugin | Description | Command |
| --- | --- | --- |
| [uv](plugins/uv) | Python packaging/dependency management with uv | `/uv-deps <add\|remove\|sync\|lock\|run> [args]` |
| [poetry](plugins/poetry) | Python packaging/dependency management with Poetry | `/poetry-deps <add\|remove\|install\|lock\|run> [args]` |

**Testing**

| Plugin | Description | Command |
| --- | --- | --- |
| [pytest](plugins/pytest) | Python testing with pytest | `/python-test [path\|-k expr\|-m marker]` |

Commands invoke the plugin's skill explicitly, bypassing auto-detection.
