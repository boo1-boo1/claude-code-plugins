# claude-code-plugins

Marketplace of Claude Code plugins.

## Usage

Add this marketplace in Claude Code:

```
/plugin marketplace add boo1-boo1/claude-code-plugins
```

Then install a plugin:

```
/plugin install basedpyright-lsp
/plugin install black-formatter
/plugin install ruff-linter
```

## Plugins

| Plugin | Description |
| --- | --- |
| [basedpyright-lsp](plugins/basedpyright-lsp) | Python language server (basedpyright) for type checking and code intelligence |
| [black-formatter](plugins/black-formatter) | Python code formatting with Black |
| [ruff-linter](plugins/ruff-linter) | Python linting and code quality checks with Ruff |

## Structure

```
.claude-plugin/
  marketplace.json     # marketplace manifest, lists all plugins
plugins/
  <plugin-name>/
    .claude-plugin/
      plugin.json       # plugin manifest (name, description, author)
    skills/
      <skill-name>/
        SKILL.md        # model-invoked skill definition
    README.md
    LICENSE
```

LSP-only plugins (e.g. `basedpyright-lsp`) define `lspServers` inline in the marketplace entry and skip `plugin.json`.
