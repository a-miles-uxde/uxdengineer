# prettier

## Summary

prettier is an opinionated code formatter covering Markdown, YAML, JSON, CSS, and JavaScript/TypeScript — it reformats a file to a single consistent style rather than just flagging violations. It was already installed via Homebrew (it depends on `node`). In this project it's configured in `.prettierrc.json` (`proseWrap: preserve`, `printWidth: 100`, matching ruff's line length), scoped by `.prettierignore` to skip vendored content (`styles/`, `.venv/`) and the memory-plugin data directories (`brain/`, `brain-2/`, `projects/`, `.remember/`).

## Daily and weekly commands

### Daily

```sh
# Reformat everything in place (or via just: just format, which also runs ruff format)
prettier --write .

# Check formatting without writing changes — exits non-zero if anything would change
prettier --check .

# Format one file
prettier --write docs/cli/prettier.md
```

### Weekly

```sh
# List only the files that would change, without diffing or writing
prettier --list-different .

# Format only changed files, using prettier's cache to skip the rest
prettier --write --cache .

# Preview what config prettier resolves for a given file
prettier --file-info docs/cli/prettier.md

# See the full list of supported languages/parsers and their file extensions
prettier --support-info
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Formatting](#formatting)
  - [Scoping and ignoring](#scoping-and-ignoring)
  - [Style options](#style-options)
  - [Configuration](#configuration)

## Common commands

`<angle brackets>` mark placeholders. Run `prettier --help <flag>` for details on a single option.

### Formatting

| Command | What it does |
| --- | --- |
| `prettier --write <path>` | Reformat file(s) in place. |
| `prettier --check <path>` | Exit non-zero if any file isn't already formatted, without writing anything. |
| `prettier --list-different <path>` | Print the names of files that differ from prettier's formatting. |
| `prettier --cache --write <path>` | Only reformat files that changed since the last cached run. |

### Scoping and ignoring

| Command | What it does |
| --- | --- |
| `prettier --ignore-path <file>` | Use a specific ignore file instead of the default `.gitignore` + `.prettierignore`. |
| `prettier -u`, `--ignore-unknown` | Skip files prettier doesn't know how to format instead of erroring. |
| `prettier --with-node-modules` | Include `node_modules` in formatting, which is excluded by default. |
| `prettier --no-error-on-unmatched-pattern` | Don't error when a glob pattern matches nothing. |

### Style options

| Command | What it does |
| --- | --- |
| `prettier --print-width <n>` | Set the line length prettier tries to wrap at (default `80`; this project uses `100`). |
| `prettier --prose-wrap <mode>` | How to wrap Markdown prose: `always`, `never`, or `preserve` (this project's default). |
| `prettier --tab-width <n>` | Spaces per indentation level (default `2`). |
| `prettier --use-tabs` | Indent with tabs instead of spaces. Default `false`. |
| `prettier --single-quote` | Use single quotes instead of double quotes in JS/JSON. Default `false`. |
| `prettier --jsx-single-quote` | Use single quotes in JSX. Default `false`. |
| `prettier --end-of-line <mode>` | Line ending style: `lf`, `crlf`, `cr`, or `auto`. Default `lf`. |
| `prettier --no-semi` | Omit semicolons, except at the start of lines that need them. |
| `prettier --trailing-comma <all\|es5\|none>` | Where to print trailing commas in multi-line structures. Default `all`. |
| `prettier --arrow-parens <always\|avoid>` | Wrap a sole arrow-function parameter in parens. Default `always`. |
| `prettier --no-bracket-spacing` | Omit spaces inside object-literal braces (`{a}` instead of `{ a }`). |
| `prettier --bracket-same-line` | Put a JSX/HTML tag's closing `>` on the last line instead of its own. Default `false`. |
| `prettier --single-attribute-per-line` | One attribute per line in HTML, Vue, and JSX. Default `false`. |
| `prettier --quote-props <as-needed\|consistent\|preserve>` | When to quote object property keys. Default `as-needed`. |
| `prettier --object-wrap <preserve\|collapse>` | Whether to wrap object literals onto multiple lines. Default `preserve`. |
| `prettier --html-whitespace-sensitivity <mode>` | How whitespace is treated in HTML: `css`, `strict`, or `ignore`. Default `css`. |
| `prettier --vue-indent-script-and-style` | Indent `<script>`/`<style>` tags in Vue files. Default `false`. |
| `prettier --embedded-language-formatting <auto\|off>` | Whether to format code embedded in strings (e.g. CSS-in-JS). Default `auto`. |
| `prettier --experimental-operator-position <start\|end>` | Where to print operators when a binary expression wraps lines. Default `end`. |
| `prettier --no-experimental-ternaries` | Keep `?`/`:` on the same line as the condition instead of Prettier's newer ternary formatting. |
| `prettier --parser <name>` | Force a specific parser (e.g. `markdown`, `yaml`, `typescript`) instead of inferring it. |

### Configuration

| Command | What it does |
| --- | --- |
| `prettier --find-config-path <file>` | Print which config file prettier would use for a given file. |
| `prettier --no-config` | Ignore any config file and use prettier's defaults. |
| `prettier --config <path>` | Use a specific config file instead of the one prettier would discover. |
| `prettier --support-info` | Print supported languages, parsers, and file extensions as JSON. |
| `prettier -v`, `--version` | Print the installed prettier version. |
