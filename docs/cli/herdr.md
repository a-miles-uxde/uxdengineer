# herdr

## Summary

herdr is a terminal workspace manager for AI coding agents. It keeps a persistent session of workspaces, tabs, and panes (similar to tmux), recognizes supported coding agents running inside them, and lets you inspect and control those agents from the command line. It was installed with Homebrew; its config is `~/.config/herdr/config.toml` and its logs are in `~/.config/herdr/`.

## Daily and weekly commands

### Daily

```sh
# Launch herdr, or reattach to your persistent session if it's already running
herdr

# Work in a separate named session, e.g. one per project
herdr --session <name>

# Reattach to a named session
herdr session attach <name>

# Check that the herdr client and background server are running
herdr status

# See the agents herdr knows about
herdr agent list

# List the workspaces in the running session
herdr workspace list
```

### Weekly

```sh
# Upgrade herdr (installed with Homebrew, so upgrade it there)
brew upgrade herdr

# Validate config.toml after editing it
herdr config check

# Apply config changes to the running server without restarting it
herdr server reload-config

# Review sessions and worktrees, then stop or remove ones you've finished with
herdr session list
herdr worktree list

# Check which built-in agent integrations are installed
herdr integration status
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Sessions](#sessions)
  - [Status and server](#status-and-server)
  - [Workspaces and tabs](#workspaces-and-tabs)
  - [Panes](#panes)
  - [Agents](#agents)
  - [Worktrees](#worktrees)
  - [Remote machines](#remote-machines)
  - [Integrations](#integrations)
  - [Config and updates](#config-and-updates)

## Common commands

`<angle brackets>` mark placeholders. Most commands talk to the running herdr server. Add `--help` to any command to see its arguments.

### Sessions

| Command | What it does |
|---|---|
| `herdr` | Launch herdr or attach to the persistent default session. |
| `herdr --session <name>` | Use or create a named persistent session. |
| `herdr session list` | List sessions. |
| `herdr session attach <name>` | Attach to a named session. |
| `herdr session stop` | Stop a running session. |
| `herdr session delete` | Delete a session that has been stopped. |
| `herdr --remote <ssh-target>` | Attach to a herdr server on another machine over SSH. |

### Status and server

| Command | What it does |
|---|---|
| `herdr status` | Show local client and running server status. |
| `herdr status server` | Show only the running server's status. |
| `herdr status client` | Show only the local client's status. |
| `herdr server` | Run herdr as a headless server. |
| `herdr server stop` | Stop the running server. |
| `herdr server reload-config` | Reload `config.toml` in the running server. |
| `brew services start herdr` | Run the herdr server in the background now and at every login. |

### Workspaces and tabs

| Command | What it does |
|---|---|
| `herdr workspace list` | List workspaces. |
| `herdr workspace create` | Create a workspace. |
| `herdr workspace focus` | Switch focus to a workspace. |
| `herdr workspace rename` | Rename a workspace. |
| `herdr workspace close` | Close a workspace. |
| `herdr tab list` | List tabs. |
| `herdr tab create` | Create a tab. |
| `herdr tab focus` | Switch focus to a tab. |
| `herdr tab rename` | Rename a tab. |
| `herdr tab close` | Close a tab. |

### Panes

| Command | What it does |
|---|---|
| `herdr pane list` | List panes. |
| `herdr pane current` | Show the pane you're in. |
| `herdr pane split` | Split a pane into two. |
| `herdr pane focus` | Move focus to a neighboring pane. |
| `herdr pane zoom` | Toggle or set zoom, filling the tab with one pane. |
| `herdr pane resize` | Resize a pane split. |
| `herdr pane swap` | Swap two panes. |
| `herdr pane read` | Print a pane's terminal output. |
| `herdr pane run` | Run a command in a pane. |
| `herdr pane send-text` | Send literal text to a pane. |
| `herdr pane send-keys` | Send key presses to a pane. |
| `herdr pane wait-output` | Wait until a pane prints matching output. |
| `herdr pane close` | Close a pane. |

### Agents

| Command | What it does |
|---|---|
| `herdr agent list` | List agents. |
| `herdr agent get` | Show details for one agent. |
| `herdr agent read` | Print an agent's terminal output. |
| `herdr agent prompt` | Submit a prompt to an agent. |
| `herdr agent wait` | Wait until an agent reaches one of the requested states. |
| `herdr agent focus` | Switch focus to an agent. |
| `herdr agent attach` | Attach your terminal directly to an agent's terminal. |
| `herdr agent start` | Start a supported interactive agent in an existing pane. |
| `herdr agent explain` | Explain how herdr detected, or failed to detect, an agent. |

### Worktrees

| Command | What it does |
|---|---|
| `herdr worktree list` | List workspaces backed by Git worktrees. |
| `herdr worktree create` | Create a Git worktree and open it as a workspace. |
| `herdr worktree open` | Open an existing Git worktree. |
| `herdr worktree remove` | Remove a worktree checkout. |

### Remote machines

| Command | What it does |
|---|---|
| `herdr machine list` | List saved SSH machines. |
| `herdr machine add` | Prepare herdr on a remote machine and save it for SSH. |
| `herdr machine rename` | Rename a saved machine. |
| `herdr machine enable` | Enable a saved machine. |
| `herdr machine disable` | Disable a saved machine without removing it. |
| `herdr machine remove` | Remove a saved machine. |

### Integrations

| Command | What it does |
|---|---|
| `herdr integration status` | Show which built-in agent integrations are installed. |
| `herdr integration install` | Install a built-in agent integration. |
| `herdr integration uninstall` | Uninstall an agent integration. |

### Config and updates

| Command | What it does |
|---|---|
| `herdr config check` | Validate `config.toml` and print diagnostics. |
| `herdr config reset-keys` | Back up `config.toml` and remove custom keybindings. |
| `herdr --default-config` | Print the default configuration, handy as a starting template. |
| `herdr channel show` | Print the configured update channel. |
| `herdr channel set stable` | Switch to the stable update channel. |
| `herdr channel set preview` | Switch to the preview channel for early releases. |
| `herdr update` | Download and install the latest herdr; with Homebrew, prefer `brew upgrade herdr`. |
| `herdr completion zsh` | Generate a zsh tab-completion script. |
| `herdr notification show` | Show a herdr notification. |
| `herdr api snapshot` | Print the live session snapshot. |
| `herdr api schema` | Print or write the bundled socket API schema. |
| `herdr --skill` | Print the skill file that teaches AI agents to use herdr. |
