# pyright

## Summary

pyright is a static type checker for Python, built by Microsoft. It's the same engine behind VS Code's Pylance extension, so command-line results match what you'd see in-editor. It was installed with Homebrew; in this project it's configured under `[tool.pyright]` in `pyproject.toml`, targeting Python 3.12 with `typeCheckingMode = "basic"` and the `.venv` created by `uv sync`.

## Daily and weekly commands

### Daily

```sh
# Type-check the whole project (or via uv so it uses the pinned version: uv run pyright)
pyright

# Type-check a specific file or directory
pyright src/module.py

# Watch mode: re-check automatically as files change
pyright --watch
```

### Weekly

```sh
# Fail (exit 1) if there are warnings, not just errors
pyright --warnings

# Only report errors, hiding warnings
pyright --level error

# Check a package's exported types are fully annotated
pyright --verifytypes <package>

# Print performance stats to spot slow files
pyright --stats
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Checking code](#checking-code)
  - [Targeting a specific environment](#targeting-a-specific-environment)
  - [Type completeness](#type-completeness)
  - [Output and diagnostics](#output-and-diagnostics)

## Common commands

`<angle brackets>` mark placeholders. Run `pyright --help` for all options.

### Checking code

| Command | What it does |
| --- | --- |
| `pyright` | Type-check the project using the nearest config (`pyproject.toml` or `pyrightconfig.json`). |
| `pyright <path>` | Type-check only the given file(s) or directory. |
| `pyright -w`, `pyright --watch` | Re-check automatically whenever a file changes. |
| `pyright -p <file-or-dir>`, `pyright --project <file-or-dir>` | Use the configuration file at a specific location. |

### Targeting a specific environment

| Command | What it does |
| --- | --- |
| `pyright --pythonversion <version>` | Analyze as if running under a specific Python version, e.g. `3.12`. |
| `pyright --pythonplatform <platform>` | Analyze for a specific platform: `Darwin`, `Linux`, `Windows`, `iOS`, `Android`. |
| `pyright -v <dir>`, `pyright --venvpath <dir>` | Directory containing virtual environments to resolve imports against. |
| `pyright --pythonpath <path>` | Use a specific Python interpreter to resolve installed packages. |

### Type completeness

| Command | What it does |
| --- | --- |
| `pyright --verifytypes <package>` | Report how completely a `py.typed` package is annotated. |
| `pyright --ignoreexternal` | When verifying types, ignore issues from external (non-local) imports. |
| `pyright --createstub <import>` | Generate a type stub file for a module. |

### Output and diagnostics

| Command                   | What it does                                                      |
| ------------------------- | ----------------------------------------------------------------- |
| `pyright --level <level>` | Set the minimum diagnostic level shown: `error` or `warning`.     |
| `pyright --warnings`      | Exit with status 1 if any warnings are reported, not just errors. |
| `pyright --outputjson`    | Print results as JSON instead of text.                            |
| `pyright --stats`         | Print detailed performance statistics after checking.             |
| `pyright --dependencies`  | Emit import dependency information.                               |
| `pyright --version`       | Print the installed pyright version.                              |
