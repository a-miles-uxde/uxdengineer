# direnv

## Summary

direnv loads and unloads environment variables based on the current directory. Drop an `.envrc` file in a project, `direnv allow` it once, and every variable it exports (API keys, `PATH` additions, an activated venv) is loaded automatically when you `cd` in and unloaded when you `cd` out. It was installed with Homebrew, with the shell integration `eval "$(direnv hook zsh)"` added to `~/.zshrc` — without that hook line, the binary does nothing on `cd`.

## Daily and weekly commands

### Daily

```sh
# Most days you do nothing — the hook loads/unloads .envrc automatically on cd.
# The one thing you'll type after creating or editing an .envrc:
direnv allow

# See what direnv currently has loaded and why
direnv status
```

### Weekly

```sh
# Open the current directory's .envrc in $EDITOR, then re-allow it on save
direnv edit

# Force a reload without leaving and re-entering the directory
direnv reload

# Revoke a previously allowed .envrc (e.g. before reviewing changes to it)
direnv deny

# Remove stale "allowed" records for .envrc files that no longer exist
direnv prune
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Authorizing .envrc files](#authorizing-envrc-files)
  - [Editing and reloading](#editing-and-reloading)
  - [Inspecting state](#inspecting-state)
  - [Shell setup](#shell-setup)

## Common commands

`<angle brackets>` mark placeholders. Run `direnv help` for the full command list.

### Authorizing .envrc files

direnv refuses to load an `.envrc` it hasn't seen approved, so a stray or malicious file in a repo you `cd` into can't silently run code.

| Command | What it does |
| --- | --- |
| `direnv allow [path]` | Approve the current (or given) `.envrc`/`.env` so it loads on `cd`. |
| `direnv deny [path]` | Revoke approval; the file will no longer be loaded. |
| `direnv status` | Show whether the current directory has an `.envrc`, whether it's allowed, and what's currently loaded. |

### Editing and reloading

| Command | What it does |
| --- | --- |
| `direnv edit [path]` | Open `.envrc` in `$EDITOR` and re-allow it automatically after saving. |
| `direnv reload` | Re-evaluate the current directory's `.envrc` without leaving and re-entering it. |
| `direnv exec <dir> <command>` | Run a command with the environment from `<dir>`'s `.envrc`, without `cd`-ing there. |

### Inspecting state

| Command | What it does |
| --- | --- |
| `direnv export <shell>` | Print the environment diff direnv would apply, for a given shell format (used internally by the hook). |
| `direnv stdlib` | Print the helper functions available inside `.envrc` (`use`, `layout`, `dotenv`, etc.). |
| `direnv prune` | Remove cached "allowed" records for `.envrc` files that no longer exist on disk. |

### Shell setup

| Command | What it does |
| --- | --- |
| `direnv hook <shell>` | Print the shell integration snippet for `bash`, `zsh`, `fish`, etc. — what gets `eval`'d in your rc file. |
| `direnv version` | Print the installed direnv version. |
