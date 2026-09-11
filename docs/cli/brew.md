# brew (Homebrew)

## Summary

Homebrew is the package manager for macOS. It installs command-line tools (called _formulae_, like `git` and `gh`) and desktop apps (called _casks_, like Google Chrome), and keeps them up to date. On this Mac it lives in `/opt/homebrew`, and `~/.zprofile` adds it to your PATH.

## Daily and weekly commands

### Daily

```sh
# Look for a package by name or description
brew search <text>

# Read about a package before installing: version, dependencies, caveats
brew info <package>

# Install a command-line tool
brew install <formula>

# Install a desktop app into /Applications
brew install --cask <app>
```

### Weekly

```sh
# Refresh Homebrew itself and its package lists
brew update

# See which installed packages have newer versions
brew outdated

# Upgrade everything that's outdated
brew upgrade

# Apps that update themselves (Chrome, Claude, GitHub Desktop, WorkFlowy) are
# skipped by a plain upgrade; --greedy includes them
brew upgrade --greedy

# Delete old versions and cached downloads to free disk space
brew cleanup

# Remove dependencies that nothing installed needs anymore
brew autoremove

# Check your setup for problems
brew doctor
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Finding packages](#finding-packages)
  - [Installing and removing](#installing-and-removing)
  - [Updating](#updating)
  - [Inspecting what's installed](#inspecting-whats-installed)
  - [Background services](#background-services)
  - [Taps and Brewfiles](#taps-and-brewfiles)
  - [Maintenance and troubleshooting](#maintenance-and-troubleshooting)

## Common commands

`<angle brackets>` mark placeholders. Run `brew help <command>` for all options.

### Finding packages

| Command               | What it does                                                           |
| --------------------- | ---------------------------------------------------------------------- |
| `brew search <text>`  | Search formulae and casks by name or description.                      |
| `brew info <package>` | Show version, dependencies, install status, and caveats for a package. |
| `brew desc <formula>` | Print a one-line description of a formula.                             |
| `brew home <package>` | Open the package's homepage in your browser.                           |

### Installing and removing

| Command | What it does |
| --- | --- |
| `brew install <formula>` | Install a command-line tool and its dependencies. |
| `brew install --cask <app>` | Install a macOS app into `/Applications`. |
| `brew reinstall <package>` | Uninstall and install a package again, useful when it seems broken. |
| `brew uninstall <package>` | Remove an installed formula or cask. |
| `brew uninstall --zap --cask <app>` | Remove an app plus its settings, caches, and support files. |
| `brew autoremove` | Uninstall dependencies no longer needed by any installed package. |

### Updating

| Command                  | What it does                                                         |
| ------------------------ | -------------------------------------------------------------------- |
| `brew update`            | Fetch the newest Homebrew and package definitions; installs nothing. |
| `brew outdated`          | List installed packages with newer versions available.               |
| `brew upgrade`           | Upgrade all outdated formulae and casks.                             |
| `brew upgrade <package>` | Upgrade only the named package.                                      |
| `brew upgrade --greedy`  | Also upgrade self-updating apps that a plain upgrade skips.          |
| `brew pin <formula>`     | Hold a formula at its current version during upgrades.               |
| `brew unpin <formula>`   | Allow a pinned formula to upgrade again.                             |

### Inspecting what's installed

| Command | What it does |
| --- | --- |
| `brew list` | List all installed formulae and casks. |
| `brew list --cask` | List installed apps only. |
| `brew leaves` | List formulae you installed directly, not pulled in as dependencies. |
| `brew deps --tree <formula>` | Show a formula's dependencies as a tree. |
| `brew uses --installed <formula>` | Show which installed packages depend on a formula. |
| `brew --prefix <formula>` | Print where a formula is installed. |
| `brew config` | Show Homebrew version, paths, and system details for bug reports. |

### Background services

| Command | What it does |
| --- | --- |
| `brew services list` | Show managed background services and whether they're running. |
| `brew services start <formula>` | Start a service now and at every login, e.g. `herdr`. |
| `brew services stop <formula>` | Stop a service and keep it from starting at login. |
| `brew services restart <formula>` | Stop and start a service, e.g. after changing its config. |
| `brew services run <formula>` | Start a service now without enabling it at login. |

### Taps and Brewfiles

| Command                    | What it does                                                      |
| -------------------------- | ----------------------------------------------------------------- |
| `brew tap`                 | List third-party repositories ("taps") Homebrew installs from.    |
| `brew tap <user>/<repo>`   | Add a third-party tap so its packages become installable.         |
| `brew untap <user>/<repo>` | Remove a tap.                                                     |
| `brew bundle dump`         | Write everything installed to a `Brewfile` in the current folder. |
| `brew bundle install`      | Install everything listed in the current folder's `Brewfile`.     |
| `brew bundle check`        | Report whether everything in the `Brewfile` is installed.         |

### Maintenance and troubleshooting

| Command | What it does |
| --- | --- |
| `brew cleanup` | Remove old package versions and stale downloads. |
| `brew cleanup -n` | Preview what `brew cleanup` would delete, without deleting anything. |
| `brew doctor` | Check for common setup problems and suggest fixes. |
| `brew missing` | Find installed formulae with missing dependencies. |
| `brew install --verbose --debug <package>` | Install with detailed output to diagnose a failing install. |
| `brew analytics off` | Stop sending anonymous usage data to Homebrew. |
