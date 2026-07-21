# basedpyright-lsp

Python language server (basedpyright) for Claude Code, providing static type checking and code intelligence.

basedpyright is a fork of Pyright with additional features, stricter defaults, and community-driven fixes.

## Usage

```
/python-typecheck [path]
```

Or just ask Claude to type check Python code — the skill auto-triggers.

## LSP

Also registers `basedpyright-langserver --stdio` as a language server for `.py`/`.pyi` files, giving live type checking/code-intelligence via basedpyright's built-in LSP.

## Supported Extensions
`.py`, `.pyi`

## Recommended configuration

basedpyright's defaults are stricter than plain pyright even at basic/standard tiers. If a project uses basedpyright but has no `[tool.basedpyright]` section yet, the skill offers a `typeCheckingMode = "standard"` + `reportMissingTypeStubs = "none"` baseline to dial that back — rather than writing it unasked. See the skill's SKILL.md for the exact block.

## Installation

Install basedpyright globally via npm:

```bash
npm install -g basedpyright
```

Or with pip:

```bash
pip install basedpyright
```

Or with pipx (recommended for CLI tools):

```bash
pipx install basedpyright
```

## More Information
- [basedpyright on npm](https://www.npmjs.com/package/basedpyright)
- [basedpyright on PyPI](https://pypi.org/project/basedpyright/)
- [GitHub Repository](https://github.com/DetachHead/basedpyright)
