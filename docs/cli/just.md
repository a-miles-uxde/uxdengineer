# just

## Summary

just is a command runner, similar to `make` but without make's tab-indentation quirks, file-target semantics, or built-in shell fights. Recipes are defined in a `justfile` at the project root; each recipe is just a named list of shell lines. It was installed with Homebrew. In this project, `justfile` wraps the `uv`/`ruff`/`pyright`/`pytest`/`vale` workflow behind short, memorable names.

## Daily and weekly commands

### Daily

```sh
# List all available recipes (also the default when you run `just` with no args)
just

# Run a specific recipe
just test

# Run the full check (lint + typecheck + test, as wired in this project's justfile)
just check
```

### Weekly

```sh
# Preview what a recipe would run, without running it
just --dry-run check

# Show the shell commands for one recipe without running it
just --show lint

# Check the justfile is formatted correctly
just --check

# Reformat the justfile in place
just --fmt --unstable
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Running recipes](#running-recipes)
  - [Inspecting recipes](#inspecting-recipes)
  - [Editing and formatting](#editing-and-formatting)
  - [Shell and environment](#shell-and-environment)

## Common commands

`<angle brackets>` mark placeholders. Run `just --help` for all options.

### Running recipes

| Command | What it does |
|---|---|
| `just` | Run the first recipe in the justfile, or list recipes if `default-list` is set. |
| `just <recipe>` | Run a specific recipe. |
| `just <recipe> <args>` | Run a recipe, passing extra arguments through to it. |
| `just --dry-run <recipe>` | Print what would run without actually running it. |
| `just --yes <recipe>` | Auto-confirm any recipe marked `[confirm]`. |
| `-f`, `--justfile <path>` | Use a specific justfile instead of searching upward from the current directory. |

### Inspecting recipes

| Command | What it does |
|---|---|
| `just --list`, `-l` | List all available recipes with their doc comments. |
| `just --show <recipe>`, `-s` | Print the full source of one recipe. |
| `just --summary` | Print just the recipe names, one line. |
| `just --groups` | List recipe groups, if any are defined. |
| `just --variables` | List all variable names defined in the justfile. |
| `just --evaluate` | Print every variable's evaluated value. |

### Editing and formatting

| Command | What it does |
|---|---|
| `just --edit`, `-e` | Open the justfile in `$VISUAL`/`$EDITOR`. |
| `just --init` | Create a starter justfile in the project root. |
| `just --fmt --unstable` | Reformat the justfile in place (still an unstable feature). |
| `just --check` | Exit non-zero and show a diff if the justfile isn't formatted correctly. |
| `just --dump` | Print the fully parsed justfile back out. |

### Shell and environment

| Command | What it does |
|---|---|
| `just --choose` | Interactively pick a recipe to run via `fzf` (or `$JUST_CHOOSER`). |
| `just -c <command>` | Run an arbitrary command with the justfile's working directory, `.env`, and variables set. |
| `just --shell <shell>` | Use a specific shell to execute recipe lines instead of the default. |
| `just --set <VAR> <VALUE>` | Override a justfile variable for this invocation. |
| `just --completions <shell>` | Print a shell completion script for `bash`, `zsh`, `fish`, `elvish`, `nushell`, or `powershell`. |
