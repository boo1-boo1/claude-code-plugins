# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A Claude Code **plugin marketplace** — no application code, no build/test/lint tooling of its own. It's a static collection of plugin manifests and skill definitions consumed by Claude Code's `/plugin marketplace add` mechanism.

## Structure

```
.claude-plugin/
  marketplace.json     # marketplace manifest — lists every plugin, single source of truth for what's installable
plugins/
  <plugin-name>/
    .claude-plugin/
      plugin.json       # plugin manifest (name, description, version, author) — omitted for LSP-only plugins
    skills/
      <skill-name>/
        SKILL.md        # model-invoked skill definition (frontmatter: name, description, version)
    README.md
    LICENSE
```

Two plugin shapes exist:
- **Skill-based** (`black-formatter`, `ruff-linter`): ships a `plugin.json` + `skills/<name>/SKILL.md`. The skill triggers when Claude detects relevant Python tooling config (e.g. `[tool.black]`/`[tool.ruff]` in `pyproject.toml`) or the user asks directly.
- **LSP-only** (`basedpyright-lsp`): no `plugin.json` at all. Its `lspServers` block is defined inline in `marketplace.json` instead, mapping file extensions to a language server command.

## Adding or editing a plugin

1. Add/edit the plugin's entry in `.claude-plugin/marketplace.json` (`plugins` array) — this is what makes it installable and is the authoritative list.
2. For skill-based plugins: create `plugins/<name>/.claude-plugin/plugin.json` and `plugins/<name>/skills/<name>/SKILL.md`. SKILL.md frontmatter description should name the exact trigger phrases (see existing skills for the pattern: "when user asks to X", "when editing Y files in a project that uses Z").
3. For LSP-only plugins: skip `plugin.json`; add the `lspServers` block directly under the plugin's marketplace.json entry.
4. Update the plugin table in root `README.md`.
5. Keep `version` fields in sync between `plugin.json` and the marketplace entry.

No CI, no package manager, no build step — validate by checking JSON is well-formed and SKILL.md frontmatter matches the pattern of existing skills.

```bash
jq empty .claude-plugin/marketplace.json plugins/*/.claude-plugin/plugin.json
```
