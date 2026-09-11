# micro

## Summary

micro is a modern, terminal-based text editor meant as an easier-to-use successor to `nano`. It ships as a single static binary, supports mouse input, multiple cursors, split panes, and a plugin system, and uses common editor shortcuts (`Ctrl-S`, `Ctrl-C`, `Ctrl-V`) instead of nano/vim-style bindings. It was installed with Homebrew; its config lives in `~/.config/micro`.

## Daily and weekly commands

### Daily

```sh
# Open a file
micro <file>

# Open a file with the cursor starting on line 42
micro <file> +42

# Open a file and jump to the first match of a search
micro <file> +/<regex>

# Open several files at once, each in its own tab
micro <file1> <file2>

# Inside the editor: save, then quit
# Ctrl-S        save
# Ctrl-Q        quit
```

### Weekly

```sh
# Update micro itself (installed with Homebrew)
brew upgrade micro

# Update all installed plugins
micro -plugin update

# See the full list of configuration options and their defaults
micro -options

# Reset the configuration directory back to defaults
micro -clean
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Opening files](#opening-files)
  - [Editing](#editing)
  - [Navigating and searching](#navigating-and-searching)
  - [Multiple cursors and splits](#multiple-cursors-and-splits)
  - [The command bar](#the-command-bar)
  - [Plugins](#plugins)
  - [Configuration](#configuration)

## Common commands

`<angle brackets>` mark placeholders. Editor shortcuts are pressed while a file is open; command-bar entries are typed after pressing `Ctrl-E`. Press `Ctrl-G` inside micro to open the full in-editor help.

### Opening files

| Command | What it does |
|---|---|
| `micro <file>` | Open a file, creating it if it doesn't exist. |
| `micro <file>:<line>:<col>` | Open a file at a specific line and column (needs `parsecursor` on). |
| `micro <file> +<line>` | Open a file with the cursor on a specific line. |
| `micro <file> +/<regex>` | Open a file and place the cursor at the first regex match. |
| `micro -config-dir <dir>` | Use a config directory other than `~/.config/micro` for this run. |

### Editing

| Shortcut | What it does |
|---|---|
| `Ctrl-S` | Save the current file. |
| `Ctrl-Z` / `Ctrl-Y` | Undo / redo. |
| `Ctrl-C` / `Ctrl-V` | Copy / paste. |
| `Ctrl-X` | Cut the current selection. |
| `Ctrl-K` | Cut the current line. |
| `Ctrl-A` | Select the whole buffer. |
| `Ctrl-D` | Duplicate the current line. |

### Navigating and searching

| Shortcut | What it does |
|---|---|
| `Ctrl-F` | Open the find bar. |
| `Ctrl-N` / `Ctrl-P` | Jump to the next / previous search match. |
| `Ctrl-G` | Open the in-editor help. |
| `Ctrl-Q` | Quit (prompts to save if there are unsaved changes). |

### Multiple cursors and splits

| Shortcut | What it does |
|---|---|
| `Alt-N` | Spawn a new cursor at the next occurrence of the selected text. |
| `Ctrl-Alt-Up` / `Ctrl-Alt-Down` | Spawn a new cursor directly above / below the current one. |
| `Ctrl-W` | Move focus to the next split. |
| `Ctrl-O` | Open a file in a new tab. |

### The command bar

Press `Ctrl-E`, then type one of these:

| Command | What it does |
|---|---|
| `save` | Save the current buffer, same as `Ctrl-S`. |
| `quit` | Close the current tab or split. |
| `replace <search> <replacement>` | Find and replace in the current buffer. |
| `vsplit <file>` / `hsplit <file>` | Open a file in a new vertical / horizontal split. |
| `tab <file>` | Open a file in a new tab. |
| `set <option> <value>` | Change a setting for the current buffer, e.g. `set tabsize 2`. |
| `show <option>` | Print the current value of a setting. |
| `bind <key> <action>` | Create a custom keybinding for this session. |
| `run <shell-command>` | Run a shell command and show its output. |

### Plugins

| Command | What it does |
|---|---|
| `micro -plugin available` | List plugins available to install. |
| `micro -plugin install <plugin>` | Install a plugin. |
| `micro -plugin list` | List installed plugins. |
| `micro -plugin update` | Update all installed plugins (or a named one). |
| `micro -plugin remove <plugin>` | Remove a plugin. |

### Configuration

| Command | What it does |
|---|---|
| `micro -options` | List every configuration option and its default value. |
| `micro -<option> <value>` | Override an option for just this session, e.g. `micro -syntax off file.c`. |
| `micro -clean` | Reset `~/.config/micro` to its defaults. |

Settings that should persist go in `~/.config/micro/settings.json`; custom colorschemes and keybindings live alongside it in the same directory.
