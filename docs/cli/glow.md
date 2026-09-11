# glow

## Summary

glow renders Markdown in the terminal, with syntax highlighting, tables, and word wrap. Point it at a file, a directory, a URL, or stdin, and it prints formatted output; run it with no arguments to browse Markdown files in the current directory in a full-screen TUI. It was installed with Homebrew; its config file is `~/Library/Preferences/glow/glow.yml`.

## Daily and weekly commands

### Daily

```sh
# Browse and preview Markdown files in the current directory
glow

# Render a specific file to the terminal
glow README.md

# Render with a pager, useful for long documents
glow -p README.md

# Render Markdown piped in from another command
cat README.md | glow -

# Render a README straight from a GitHub repo
glow github.com/<owner>/<repo>
```

### Weekly

```sh
# Update glow itself (installed with Homebrew)
brew upgrade glow

# Open the config file for editing
glow config

# Force a light or dark style regardless of terminal background
glow -s light README.md
glow -s dark README.md

# Generate a shell completion script
glow completion zsh
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Rendering Markdown](#rendering-markdown)
  - [Styling and layout](#styling-and-layout)
  - [Browsing (TUI mode)](#browsing-tui-mode)
  - [Reading a document (pager)](#reading-a-document-pager)
  - [Configuration](#configuration)

## Common commands

`<angle brackets>` mark placeholders. Run `glow --help` or `glow <command> --help` for all options.

### Rendering Markdown

| Command | What it does |
| --- | --- |
| `glow <file>` | Render a local Markdown file to the terminal. |
| `glow <dir>` | Open the Markdown file picker rooted at a directory. |
| `glow -` | Render Markdown piped in on stdin. |
| `glow <url>` | Render a Markdown file fetched from a URL. |
| `glow github.com/<owner>/<repo>` | Fetch and render a repo's README. |
| `glow -p <file>` | Render through your pager (`$PAGER`) instead of dumping to stdout. |

### Styling and layout

| Command | What it does |
| --- | --- |
| `glow -s <style>` | Set the color style: `auto`, `dark`, `light`, `notty`, or a path to a custom JSON stylesheet. |
| `glow -w <width>` | Word-wrap output at a specific column width; `0` disables wrapping. |
| `glow -l <file>` | Show line numbers (TUI mode only). |
| `glow -n <file>` | Preserve blank lines exactly as written instead of collapsing them. |
| `glow -a` | Show hidden system files and directories in the file picker. |

### Browsing (TUI mode)

| Command             | What it does                                               |
| ------------------- | ---------------------------------------------------------- |
| `glow -t <dir>`     | Force the full-screen TUI browser, even for a single file. |
| `↑`/`k`, `↓`/`j`    | Move the file selection up / down.                         |
| `g` / `G`           | Jump to the top / bottom of the list.                      |
| `/`                 | Filter the file list by name.                              |
| `Enter`             | Open the selected file or directory.                       |
| `Esc` / `Backspace` | Go back to the file list.                                  |
| `q` / `Ctrl-C`      | Quit.                                                      |

### Reading a document (pager)

| Key              | What it does                                           |
| ---------------- | ------------------------------------------------------ |
| `↑`/`k`, `↓`/`j` | Scroll up / down.                                      |
| `Space` / `b`    | Page down / up.                                        |
| `g` / `G`        | Jump to the top / bottom of the document.              |
| `/`              | Search within the document.                            |
| `n`              | Jump to the next search match.                         |
| `c`              | Copy the document to the clipboard.                    |
| `e`              | Open the source file in `$EDITOR`.                     |
| `q` / `Esc`      | Return to the file list (or quit, if opened directly). |

### Configuration

| Command | What it does |
| --- | --- |
| `glow config` | Open `glow.yml` in `$EDITOR` to change defaults like style and width. |
| `glow completion <shell>` | Print a completion script for `bash`, `zsh`, `fish`, or `powershell`. |
| `glow -v` | Show the installed version. |
