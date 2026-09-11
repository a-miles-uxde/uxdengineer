# pytest

## Summary

pytest is the standard test runner for Python. It discovers tests by convention (files named `test_*.py`, functions named `test_*`), needs no boilerplate classes, and supports plain `assert` statements instead of `self.assertEqual(...)`-style methods. It was installed globally with `uv tool install pytest` (a pipx-style isolated install), and also pulled in as a project dev dependency via `uv sync`. In this project it's configured under `[tool.pytest.ini_options]` in `pyproject.toml`, with `testpaths = ["tests"]`.

## Daily and weekly commands

### Daily

```sh
# Run the full test suite (or via uv so it uses the pinned version: uv run pytest)
pytest

# Run one file
pytest tests/test_setup.py

# Run tests whose name matches a substring
pytest -k "setup"

# Stop at the first failure
pytest -x
```

### Weekly

```sh
# Show local variables in tracebacks, useful when debugging a failure
pytest -l

# Drop into the debugger at the point of failure
pytest --pdb

# Re-run only what failed last time
pytest --lf

# Run failures first, then everything else
pytest --ff

# List what would run without actually running it
pytest --collect-only
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Selecting tests](#selecting-tests)
  - [Output and reporting](#output-and-reporting)
  - [Debugging failures](#debugging-failures)
  - [Collection](#collection)
  - [Configuration](#configuration)

## Common commands

`<angle brackets>` mark placeholders. Run `pytest --help` for all options.

### Selecting tests

| Command | What it does |
|---|---|
| `pytest <path>` | Run only the tests in a given file or directory. |
| `pytest -k <expr>` | Run tests whose name matches a substring expression, e.g. `-k "auth and not slow"`. |
| `pytest -m <marker-expr>` | Run tests matching a marker expression, e.g. `-m "not slow"`. |
| `pytest --deselect <nodeid>` | Exclude a specific test by node id. |
| `pytest -x`, `--exitfirst` | Stop after the first failure or error. |
| `pytest --maxfail=<num>` | Stop after a given number of failures. |
| `pytest --lf`, `--last-failed` | Rerun only the tests that failed last time. |
| `pytest --ff`, `--failed-first` | Run all tests, but run last run's failures first. |

### Output and reporting

| Command | What it does |
|---|---|
| `pytest -v` | Increase verbosity, printing each test's name and result. |
| `pytest -q` | Decrease verbosity, printing a condensed summary. |
| `pytest -r <chars>` | Show extra summary info for given outcomes, e.g. `-ra` for everything but passed. |
| `pytest --tb=<style>` | Set traceback format: `auto`, `long`, `short`, `line`, `native`, or `no`. |
| `pytest --durations=<N>` | Show the N slowest tests (use `0` for all). |
| `pytest --junitxml=<path>` | Write a JUnit XML report, useful for CI. |

### Debugging failures

| Command | What it does |
|---|---|
| `pytest -s` | Don't capture output; shortcut for `--capture=no`. Lets `print()` show live. |
| `pytest -l`, `--showlocals` | Show local variable values in tracebacks. |
| `pytest --pdb` | Drop into the interactive debugger on a failure or error. |
| `pytest --trace` | Break into the debugger at the start of every test. |
| `pytest --full-trace` | Show the complete traceback instead of the shortened default. |

### Collection

| Command | What it does |
|---|---|
| `pytest --collect-only` | List which tests would run, without running them. |
| `pytest --ignore=<path>` | Skip a path during collection. |
| `pytest --doctest-modules` | Also run doctests found in `.py` modules. |
| `pytest --continue-on-collection-errors` | Run whatever can be collected even if some files fail to import. |

### Configuration

| Command | What it does |
|---|---|
| `pytest --fixtures` | List available fixtures, sorted by plugin. |
| `pytest --markers` | List all registered markers (builtin, plugin, and project-defined). |
| `pytest --cache-clear` | Clear pytest's cache (used by `--lf`/`--ff`) before running. |
| `pytest -c <file>`, `--config-file <file>` | Load configuration from a specific file instead of auto-detecting `pyproject.toml`. |
| `pytest -V`, `--version` | Show the installed pytest version and, if given twice, loaded plugins. |
