# node (Node.js, npm, npx)

## Summary

Node.js is a JavaScript runtime. It arrived on this machine as a dependency of `prettier` (prettier is itself a Node CLI tool), installed via Homebrew, but `node`, `npm`, and `npx` are all commonly reached for directly, so they get the same reference treatment as the rest of the stack. `npm` is Node's package manager and comes bundled with `node`; `npx` runs a package's CLI without installing it globally first.

## Daily and weekly commands

### Daily

```sh
# Run a JavaScript file
node script.js

# Run a package's CLI once, without installing it globally
npx <package> <args>

# Install a project's dependencies (reads package.json)
npm install

# Run a script defined in package.json
npm run <script-name>
```

### Weekly

```sh
# Add a dependency to package.json
npm install <package>

# Add it as a dev-only dependency
npm install --save-dev <package>

# List top-level installed packages
npm ls

# List globally installed packages (what's on PATH via npm)
npm ls -g --depth=0

# Check for known vulnerabilities in dependencies
npm audit

# Update npm itself
npm install -g npm@latest
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Running code](#running-code)
  - [Installing packages](#installing-packages)
  - [Inspecting and auditing](#inspecting-and-auditing)
  - [Scripts](#scripts)
  - [Diagnostics](#diagnostics)

## Common commands

`<angle brackets>` mark placeholders. Run `npm help <command>` or `node --help` for full option lists.

### Running code

| Command | What it does |
| --- | --- |
| `node <file>` | Run a JavaScript file. |
| `node -c <file>`, `--check` | Syntax-check a script without executing it. |
| `node -` | Read a script from stdin. |
| `npx <package>` | Download (if needed) and run a package's CLI once, without a global install. |
| `npx --package=<pkg> -c '<cmd>'` | Run an arbitrary command with a specific package available. |

### Installing packages

| Command | What it does |
| --- | --- |
| `npm install` | Install all dependencies listed in the current project's `package.json`. |
| `npm install <package>` | Add a package as a dependency and install it. |
| `npm install --save-dev <package>` | Add a package as a dev-only dependency. |
| `npm install -g <package>` | Install a package's CLI globally, available on `PATH`. |
| `npm uninstall <package>` | Remove a dependency. |
| `npm update` | Update dependencies to the latest version allowed by `package.json`. |

### Inspecting and auditing

| Command                 | What it does                                                     |
| ----------------------- | ---------------------------------------------------------------- |
| `npm ls`                | List the current project's installed dependency tree.            |
| `npm ls -g --depth=0`   | List globally installed packages, one level deep.                |
| `npm outdated`          | Show which dependencies have newer versions available.           |
| `npm audit`             | Check installed dependencies for known vulnerabilities.          |
| `npm explain <package>` | Show why a package is installed — which dependency pulled it in. |

### Scripts

| Command            | What it does                                              |
| ------------------ | --------------------------------------------------------- |
| `npm run <script>` | Run a script defined in `package.json`'s `scripts` field. |
| `npm test`         | Shortcut for `npm run test`.                              |
| `npm start`        | Shortcut for `npm run start`.                             |
| `npm init`         | Create a new `package.json` interactively.                |

### Diagnostics

| Command                | What it does                                 |
| ---------------------- | -------------------------------------------- |
| `node --version`, `-v` | Print the installed Node.js version.         |
| `npm --version`, `-v`  | Print the installed npm version.             |
| `npm doctor`           | Check npm's environment for common problems. |
| `npm config list`      | Show npm's current configuration.            |
