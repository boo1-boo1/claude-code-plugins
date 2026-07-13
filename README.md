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
/plugin install black-formatter
/plugin install ruff-linter
```

## Plugins

| Plugin | Description | Command |
| --- | --- | --- |
| [basedpyright-lsp](plugins/basedpyright-lsp) | Python language server (basedpyright) for type checking and code intelligence (LSP: `basedpyright-langserver`) | `/python-typecheck [path]` |
| [black-formatter](plugins/black-formatter) | Python code formatting with Black | `/python-format [path]` |
| [ruff-linter](plugins/ruff-linter) | Python linting and code quality checks with Ruff (LSP: `ruff server`) | `/python-lint [path] [--fix]` |

Commands invoke the plugin's skill explicitly, bypassing auto-detection.
