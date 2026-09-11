# tree

## Summary

tree prints a directory's contents as an indented, recursive tree, which is faster to scan than `ls -R` or `find` for understanding a project's shape. It was installed with Homebrew.

## Daily and weekly commands

### Daily

```sh
# Show the tree rooted at the current directory
tree

# Only go 2 levels deep
tree -L 2

# Show directories only, skip files
tree -d

# Hide files/dirs matched by .gitignore
tree --gitignore
```

### Weekly

```sh
# Show hidden files too
tree -a

# Show file sizes in human-readable form
tree -h

# List directories before files, alphabetically within each
tree --dirsfirst

# Exclude a pattern, e.g. build artifacts
tree -I "node_modules|.venv|__pycache__"

# Save the tree to a file
tree -o structure.txt
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Scoping the listing](#scoping-the-listing)
  - [Filtering](#filtering)
  - [Sorting](#sorting)
  - [File details](#file-details)
  - [Output formats](#output-formats)

## Common commands

`<angle brackets>` mark placeholders. Run `tree --help` for the full option list.

### Scoping the listing

| Command | What it does |
|---|---|
| `tree <dir>` | Print the tree rooted at a specific directory instead of the current one. |
| `tree -L <level>` | Limit recursion to a given depth. |
| `tree -d` | List directories only. |
| `tree -f` | Print the full path prefix for every entry, not just the name. |
| `tree -x` | Don't descend into other filesystems/mount points. |

### Filtering

| Command | What it does |
|---|---|
| `tree --gitignore` | Exclude anything matched by a `.gitignore` in scope. |
| `tree -I <pattern>` | Exclude files/dirs matching a pattern, e.g. `-I "*.pyc"`. |
| `tree -P <pattern>` | Include only files matching a pattern. |
| `tree --matchdirs` | Apply `-P` pattern matching to directory names too, not just files. |
| `tree --prune` | Drop empty directories from the output. |
| `tree -a` | Include hidden (dotfile) entries. |

### Sorting

| Command | What it does |
|---|---|
| `tree -t` | Sort by last modification time. |
| `tree -r` | Reverse the sort order. |
| `tree -U` | Leave files unsorted (fastest, as returned by the filesystem). |
| `tree --dirsfirst` | List all directories before files at each level. |
| `tree --sort <key>` | Sort by `name`, `version`, `size`, `mtime`, `ctime`, or `none`. |

### File details

| Command | What it does |
|---|---|
| `tree -s` | Show file size in bytes. |
| `tree -h` | Show file size in human-readable units (KB, MB, …). |
| `tree --du` | Show directory sizes computed from their contents. |
| `tree -D` | Show last modification date for each entry. |
| `tree -p` | Show Unix permissions for each entry. |
| `tree -u` / `tree -g` | Show the file owner / group. |

### Output formats

| Command | What it does |
|---|---|
| `tree -o <file>` | Write output to a file instead of stdout. |
| `tree -J` | Print the tree as JSON. |
| `tree -X` | Print the tree as XML. |
| `tree -H <baseHREF>` | Print the tree as an HTML page linking to files under `baseHREF`. |
| `tree --noreport` | Omit the trailing file/directory count summary. |
