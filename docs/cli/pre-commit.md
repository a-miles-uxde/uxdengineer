# pre-commit

## Summary

pre-commit manages and runs Git hooks from a shared, versioned config, so linting and formatting happen automatically before a commit lands instead of relying on everyone remembering to run tools by hand. It was installed with Homebrew; hooks for this project are defined in `.pre-commit-config.yaml` (ruff lint + format, trailing-whitespace, end-of-file-fixer, check-yaml/toml, large-file guard) and installed into `.git/hooks/pre-commit`.

## Daily and weekly commands

### Daily

```sh
# Runs automatically on `git commit` once installed — nothing to do here.
# To run the same checks manually against staged files:
pre-commit run

# Run every hook against every file, not just staged ones
pre-commit run --all-files

# Run just one hook by id
pre-commit run ruff
```

### Weekly

```sh
# Wire the hook into .git/hooks/pre-commit (one-time per clone)
pre-commit install

# Update every hook repo in .pre-commit-config.yaml to its latest tagged release
pre-commit autoupdate

# Clear cached hook environments if something seems stale
pre-commit clean

# Remove unused cached hook repos to reclaim disk space
pre-commit gc
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Running hooks](#running-hooks)
  - [Installing and uninstalling](#installing-and-uninstalling)
  - [Updating hooks](#updating-hooks)
  - [Config and maintenance](#config-and-maintenance)

## Common commands

`<angle brackets>` mark placeholders. Run `pre-commit help <command>` for all options.

### Running hooks

| Command | What it does |
|---|---|
| `pre-commit run` | Run hooks against currently staged files. |
| `pre-commit run --all-files` | Run hooks against every file in the repo. |
| `pre-commit run <hook-id>` | Run only the named hook, e.g. `pre-commit run ruff-format`. |
| `pre-commit run --files <path...>` | Run hooks against specific files regardless of staging. |
| `pre-commit run --show-diff-on-failure` | Print a diff of what a failing hook changed. |
| `pre-commit run --hook-stage <stage>` | Run hooks registered for a specific Git hook stage, e.g. `pre-push`. |

### Installing and uninstalling

| Command | What it does |
|---|---|
| `pre-commit install` | Install the `pre-commit` hook into `.git/hooks/`, so it runs on every commit. |
| `pre-commit install --install-hooks` | Install the hook and pre-fetch every hook environment in one step. |
| `pre-commit install -t <hook-type>` | Install for a different Git hook stage, e.g. `pre-push` or `commit-msg`. |
| `pre-commit install-hooks` | Pre-fetch and build environments for all configured hooks without installing the git hook itself. |
| `pre-commit uninstall` | Remove the installed Git hook. |

### Updating hooks

| Command | What it does |
|---|---|
| `pre-commit autoupdate` | Bump every hook repo's `rev` in `.pre-commit-config.yaml` to its latest tag. |
| `pre-commit autoupdate --bleeding-edge` | Update to each repo's `HEAD` instead of its latest tagged release. |
| `pre-commit autoupdate --repo <repo>` | Only update one specific hook repo. |

### Config and maintenance

| Command | What it does |
|---|---|
| `pre-commit sample-config` | Print a starter `.pre-commit-config.yaml` to stdout. |
| `pre-commit validate-config` | Check `.pre-commit-config.yaml` for schema errors. |
| `pre-commit clean` | Remove cached hook environments, forcing a clean reinstall next run. |
| `pre-commit gc` | Remove cached hook repos no longer referenced by any config. |
