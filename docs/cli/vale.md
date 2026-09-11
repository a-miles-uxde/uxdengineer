# vale

## Summary

vale is a syntax-aware linter for prose — Markdown, AsciiDoc, reStructuredText, HTML, and more — the same role ruff plays for Python, but for writing. It checks things a spell-checker can't: passive voice, weasel words, inclusive-language issues, readability scores, and word-repetition. It was installed with Homebrew. In this project it's configured in `.vale.ini` at the repo root, scoped to `articles/**/*.md` and `docs/**/*.md`, using the styles `alex`, `write-good`, `proselint`, and `Readability` plus a project vocabulary at `styles/Vocab/uxdengineer/accept.txt` for terms like `homebrew`, `zsh`, and `github` that aren't in the dictionary.

## Daily and weekly commands

### Daily

```sh
# Lint everything covered by .vale.ini (or via the justfile: just prose)
vale articles docs

# Lint one file
vale docs/cli/vale.md

# Only show errors, hiding warnings and suggestions
vale --minAlertLevel=error articles docs
```

### Weekly

```sh
# Re-fetch the configured styles (alex, write-good, proselint, Readability)
vale sync

# Print the fully resolved config, useful when a rule isn't firing as expected
vale ls-config

# Get results as JSON, useful for piping into other tooling
vale --output=JSON articles docs
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Linting](#linting)
  - [Filtering results](#filtering-results)
  - [Styles and configuration](#styles-and-configuration)
  - [Diagnostics](#diagnostics)

## Common commands

`<angle brackets>` mark placeholders. Run `vale <command> --help` for a command's own options.

### Linting

| Command | What it does |
|---|---|
| `vale <path...>` | Lint one or more files or directories against the styles configured for them in `.vale.ini`. |
| `vale -` | Lint content piped in on stdin. |
| `vale --ext=<ext> -` | Tell vale what syntax to assume for stdin input, e.g. `--ext=.md`. |
| `vale --glob='*.{md,txt}' <path>` | Restrict linting to files matching a glob pattern. |

### Filtering results

| Command | What it does |
|---|---|
| `vale --minAlertLevel=<level>` | Only show alerts at or above a level: `suggestion`, `warning`, or `error`. |
| `vale --filter='<expr>'` | Filter results by an expression, e.g. `--filter='.Name == "alex.Race"'`. |
| `vale --output=JSON <path>` | Print results as JSON instead of the default line-oriented text. |
| `vale --output=line <path>` | Print results as one compact line per alert. |

### Styles and configuration

| Command | What it does |
|---|---|
| `vale sync` | Download and install the styles listed in `Packages =` in `.vale.ini`. |
| `vale ls-config` | Print the fully resolved configuration as JSON. |
| `vale ls-dirs` | Print the directories vale searches for global config and styles. |
| `vale --config=<path> <path>` | Use a specific `.vale.ini` instead of the one discovered automatically. |
| `vale --no-global` | Ignore the global config directory and use only the local `.vale.ini`. |

### Diagnostics

| Command | What it does |
|---|---|
| `vale ls-metrics <file>` | Print internal metrics (word count, reading time, etc.) for a file. |
| `vale ls-vars` | List environment variables vale reads, e.g. `VALE_CONFIG_PATH`. |
| `vale --no-exit` | Return exit code 0 even if alerts were found — useful in CI steps that shouldn't hard-fail. |
| `vale -v`, `--version` | Print the installed vale version. |
