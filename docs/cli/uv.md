# uv

## Summary

uv is an extremely fast Python package and project manager, written in Rust by Astral (the team behind `ruff`). It replaces `pip`, `pip-tools`, `virtualenv`, `pyenv`, and often `poetry` for a single project: it resolves and installs dependencies, manages the virtual environment, and installs and pins Python versions themselves. It was installed with Homebrew. Project state lives in `pyproject.toml` (what you want) and `uv.lock` (the exact resolved versions); a `.python-version` file pins the project's Python version.

## Daily and weekly commands

### Daily

```sh
# Install/update the project's venv to match pyproject.toml and uv.lock
uv sync

# Run a command inside the project's venv, syncing first if needed
uv run pytest

# Add a dependency and update the lockfile
uv add requests

# Add a development-only dependency (linters, test tools)
uv add --dev ruff
```

### Weekly

```sh
# Remove a dependency
uv remove requests

# Re-resolve the lockfile without installing anything
uv lock

# Show the resolved dependency tree
uv tree

# Install a Python CLI tool globally, isolated from any project (pipx-style)
uv tool install pytest

# Pin the project to a specific Python version
uv python pin 3.12
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Project setup](#project-setup)
  - [Dependencies](#dependencies)
  - [Running code](#running-code)
  - [Python version management](#python-version-management)
  - [Standalone tools](#standalone-tools)
  - [pip-compatible interface](#pip-compatible-interface)
  - [Cache and maintenance](#cache-and-maintenance)

## Common commands

`<angle brackets>` mark placeholders. Run `uv help <command>` for all options.

### Project setup

| Command | What it does |
| --- | --- |
| `uv init` | Create a new project (`pyproject.toml`, `.python-version`, a starter file) in the current directory. |
| `uv init --lib` | Create a project set up as an importable library. |
| `uv init --script` | Create a single-file script with inline dependency metadata instead of a full project. |
| `uv venv` | Create a bare virtual environment without requiring a project. |

### Dependencies

| Command | What it does |
| --- | --- |
| `uv add <package>` | Add a dependency to `pyproject.toml` and update `uv.lock`. |
| `uv add --dev <package>` | Add a dependency to the `dev` dependency group only. |
| `uv remove <package>` | Remove a dependency from the project. |
| `uv sync` | Install the project's environment to match `pyproject.toml` / `uv.lock`. |
| `uv lock` | Update `uv.lock` without installing anything. |
| `uv tree` | Show the resolved dependency tree. |

### Running code

| Command | What it does |
| --- | --- |
| `uv run <command>` | Run a command inside the project's venv, syncing first if the lockfile is out of date. |
| `uv run python` | Start a Python REPL inside the project's venv. |
| `uv run --with <package> <command>` | Run a command with an extra, ad-hoc dependency available, without adding it to the project. |
| `uv run --script <file>` | Run a standalone script, resolving its inline dependency metadata. |

### Python version management

| Command | What it does |
| --- | --- |
| `uv python list` | List Python versions uv knows about, installed or downloadable. |
| `uv python install <version>` | Download and install a specific Python version. |
| `uv python pin <version>` | Pin the project to a Python version via `.python-version`. |
| `uv python find <version>` | Locate an installed Python matching a version constraint. |
| `uv python uninstall <version>` | Remove an installed Python version. |

### Standalone tools

| Command | What it does |
| --- | --- |
| `uv tool install <package>` | Install a package's CLI entry points globally in an isolated environment (like `pipx install`). |
| `uv tool run <package>` | Run a tool once without installing it (like `uvx`/`pipx run`). |
| `uv tool list` | List installed tools. |
| `uv tool uninstall <package>` | Remove an installed tool. |
| `uv tool upgrade <package>` | Upgrade an installed tool. |

### pip-compatible interface

| Command | What it does |
| --- | --- |
| `uv pip install <package>` | Install into the active environment using familiar pip syntax. |
| `uv pip compile <requirements.in>` | Resolve requirements into a locked `requirements.txt`, without a `pyproject.toml` project. |

### Cache and maintenance

| Command          | What it does                                      |
| ---------------- | ------------------------------------------------- |
| `uv cache clean` | Clear uv's package cache.                         |
| `uv self update` | Update uv itself to the latest version.           |
| `uv build`       | Build the project into sdist/wheel distributions. |
| `uv publish`     | Upload built distributions to a package index.    |
