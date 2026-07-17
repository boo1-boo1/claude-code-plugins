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
    commands/
      <name>.md          # slash command (frontmatter: description, argument-hint) that invokes the skill for explicit/manual triggering
    README.md
    LICENSE
```

All three current plugins (`black-formatter`, `ruff-linter`, `basedpyright-lsp`) are now **skill-based**: each ships a `plugin.json` + `skills/<name>/SKILL.md` + `commands/<name>.md`. The skill triggers when Claude detects relevant Python tooling config (e.g. `[tool.black]`/`[tool.ruff]`/`[tool.basedpyright]` in `pyproject.toml`) or the user asks directly. `basedpyright-lsp` additionally keeps an `lspServers` block inline in `marketplace.json` (no `plugin.json` needed for that block alone).

A plugin can also be **LSP-only**: no `plugin.json`, just an `lspServers` block in `marketplace.json` mapping file extensions to a language server command. It becomes hybrid the moment it needs a non-LSP command (e.g. a CLI-driven `/python-typecheck`, as `basedpyright-lsp` did): add `plugin.json` + skill + command to it same as skill-based plugins, keep the `lspServers` block in marketplace.json unchanged.

`lspServers.args` isn't uniform — check the binary's own docs before assuming stdio is default (e.g. `basedpyright-langserver` needs explicit `--stdio`).

## Adding or editing a plugin

1. Add/edit the plugin's entry in `.claude-plugin/marketplace.json` (`plugins` array) — this is what makes it installable and is the authoritative list.
2. For skill-based plugins: create `plugins/<name>/.claude-plugin/plugin.json` and `plugins/<name>/skills/<name>/SKILL.md`. SKILL.md frontmatter description should name the exact trigger phrases (see existing skills for the pattern: "when user asks to X", "when editing Y files in a project that uses Z").
   Also add `plugins/<name>/commands/<name>.md` — a slash command (frontmatter: `description`, `argument-hint`) whose body tells Claude to invoke the skill, so users can trigger explicitly instead of relying on auto-detection.
3. For LSP-only plugins: skip `plugin.json`; add the `lspServers` block directly under the plugin's marketplace.json entry.
4. Update the plugin table in root `README.md`.
5. Keep `version` fields in sync between `plugin.json` and the marketplace entry.

No CI, no package manager, no build step — validate by checking JSON is well-formed and SKILL.md frontmatter matches the pattern of existing skills.

```bash
jq empty .claude-plugin/marketplace.json plugins/*/.claude-plugin/plugin.json
```

## Versioning

Two independent SemVer counters. Don't conflate them.

**Per-plugin version** — lives in each `plugins/<name>/.claude-plugin/plugin.json` AND the matching marketplace `plugins[]` entry. Keep the two in sync. Bump when *that plugin's* internals change:
- `major` — remove a capability or otherwise break consumers (e.g. dropping an `lspServers` block a user relied on).
- `minor` — add a feature (new command, new skill trigger, added LSP).
- `patch` — fix or docs-only change inside the plugin.

**Marketplace version** — `metadata.version` in `marketplace.json`. Tracks the *catalog*, not any single plugin. Bump when:
- `major` — remove or rename a plugin, or break the marketplace schema/structure (consumers resolve differently).
- `minor` — add a plugin to the `plugins` array.
- `patch` — catalog metadata fixups (owner, description).

A plugin-internal change bumps only that plugin's version, never the marketplace. Catalog membership or shape changing bumps only the marketplace version.

No git tags — Claude Code consumes the marketplace via `/plugin marketplace add` reading HEAD, not tags. Version fields are the source of truth; a git tag would be a purely cosmetic marker and is not maintained.
