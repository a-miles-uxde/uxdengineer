# ruff

## Summary

ruff is an extremely fast Python linter and code formatter, written in Rust by Astral. It replaces `flake8`, `isort`, and `black` with a single binary that runs orders of magnitude faster than the tools it stands in for. It was installed with Homebrew; in this project it's configured under `[tool.ruff]` in `pyproject.toml`, scoped to `line-length = 100` and rule set `E, F, I, UP, B, SIM`.

## Daily and weekly commands

### Daily

```sh
# Lint the project (or run via uv so it uses the pinned version: uv run ruff check .)
ruff check .

# Lint and auto-fix everything that's safely fixable
ruff check --fix .

# Reformat the project
ruff format .

# Preview formatting changes without writing them
ruff format --diff .
```

### Weekly

```sh
# See what a specific rule checks for and why
ruff rule F401

# Apply fixes that might change intent, not just style (review the diff after)
ruff check --unsafe-fixes .

# Print per-rule violation counts instead of a full listing
ruff check --statistics .

# Re-lint automatically whenever a file changes
ruff check --watch .

# Print the currently active config, useful for confirming what pyproject.toml resolves to
ruff config
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Linting](#linting)
  - [Formatting](#formatting)
  - [Rules and configuration](#rules-and-configuration)
  - [Maintenance](#maintenance)

## Common commands

`<angle brackets>` mark placeholders. Run `ruff help <command>` for all options.

### Linting

| Command | What it does |
| --- | --- |
| `ruff check .` | Lint the current directory and report violations. |
| `ruff check --fix .` | Apply safe auto-fixes for fixable violations. |
| `ruff check --unsafe-fixes .` | Also apply fixes that may change behavior, not just style. |
| `ruff check --diff .` | Show fixes as a diff instead of writing them. |
| `ruff check --select <CODE> .` | Lint using only the given rule code(s), overriding config. |
| `ruff check --extend-select <CODE> .` | Lint with the given rule code(s) added on top of the configured set. |
| `ruff check --ignore <CODE> .` | Lint while skipping the given rule code(s). |
| `ruff check --statistics .` | Show violation counts grouped by rule instead of every instance. |
| `ruff check --watch .` | Re-run automatically whenever a file changes. |

### Formatting

| Command | What it does |
| --- | --- |
| `ruff format .` | Reformat all files in place. |
| `ruff format --check .` | Exit non-zero if any file isn't already formatted, without writing changes. |
| `ruff format --diff .` | Print the formatting diff without writing changes. |

### Rules and configuration

| Command | What it does |
| --- | --- |
| `ruff rule <CODE>` | Explain what a specific rule checks for. |
| `ruff rule --all` | List and explain every available rule. |
| `ruff linter` | List all upstream linters ruff reimplements (pyflakes, pycodestyle, isort, etc.) and their rule prefixes. |
| `ruff config` | Print the resolved configuration ruff is currently using. |
| `ruff config <key>` | Show the resolved value and docs for a single config option. |

### Maintenance

| Command | What it does |
| --- | --- |
| `ruff version` | Print the installed ruff version. |
| `ruff clean` | Clear ruff's cache in the current directory tree. |
| `ruff check --add-noqa .` | Insert `# noqa` comments for existing violations instead of fixing them. |
