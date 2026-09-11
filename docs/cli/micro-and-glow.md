# micro + glow

## Summary

micro and glow cover opposite halves of working with Markdown in the terminal: glow is a read-only renderer (it turns `.md` into formatted output), and micro is a general-purpose editor (it turns keystrokes into `.md`). Neither tool knows the other exists, but they compose cleanly around one shared convention: `$EDITOR`. Point `$EDITOR` at micro and glow's pager will shell out to it whenever you want to edit the file you're reading — read in glow, edit in micro, save and quit to land back in glow with the re-rendered result.

## Setting up the integration

The handoff runs on `$EDITOR` — it's what glow's pager launches when you press `e`. The simplest setup is `export EDITOR=micro` in your shell profile, but that makes micro the default editor for _every_ program that reads `$EDITOR`, not just glow: `git commit`, `gh pr create`, `crontab -e`, `sudoedit`, and anything else that shells out for text input, in every terminal session, including ones an IDE opens for you.

To get the glow ↔ micro handoff without any of that spillover, set `EDITOR` only for the single command that needs it, instead of exporting it globally. A shell function is the easiest way to do this:

```sh
# ~/.zprofile or ~/.zshrc — no `export`, so nothing outside this function sees it
glowm() {
  EDITOR=micro VISUAL=micro glow "$@"
}
```

`EDITOR=micro glow "$@"` sets the variable for that one child process only; it never touches your shell's environment, so every other command — including `git commit` run from an IDE's integrated terminal, or an IDE's own built-in commit-message UI — keeps using whatever editor it already used. Reload your shell (or `source ~/.zprofile`) after adding this, then use `glowm` in place of `glow` whenever you want the `e` key to open micro:

```sh
glowm docs/cli/micro.md
```

If you're sure you want micro as your everyday `$EDITOR` everywhere — not just for this handoff — the global `export EDITOR=micro` from the top of this section is the way to do that; just know it's a systemwide change, not a glow-specific one.

## Daily workflow

```sh
# Browse this repo's docs; press Enter to open a file, e to edit it in micro
glowm docs/cli

# Or jump straight to reading one file
glowm docs/cli/micro.md

# From inside glow's pager, press `e` to open the current file in micro.
# Save (Ctrl-S) and quit (Ctrl-Q) in micro to drop back into glow's pager,
# which reloads the file so you immediately see the rendered result.

# Prefer to edit first, then check the rendering separately:
micro docs/cli/micro.md
glow -p docs/cli/micro.md
```

### Weekly

```sh
# Keep both tools current
brew upgrade micro glow

# Confirm the glowm function still resolves to micro
type glowm
```

## Why this pairing works

| Role | Tool | What it's good at |
| --- | --- | --- |
| Reading | glow | Rendered headings, tables, code blocks, and word wrap — what a doc will actually look like. |
| Writing | micro | Syntax highlighting for the raw Markdown source, multiple cursors, undo/redo, and familiar `Ctrl-S`/`Ctrl-Q` shortcuts. |
| Handoff | `$EDITOR` | The one setting that lets glow call out to micro without either tool needing to know about the other. |

## Notes

- Neither tool has a plugin or extension that talks to the other directly — `micro -plugin available` has no glow integration, and glow has no editor plugin system. `$EDITOR` is the whole mechanism, and it's enough: glow blocks on the editor process and resumes exactly where you left off once it exits.
- Because glow always reads from disk, there's no sync step — whatever micro last saved is what glow renders next.
- `EDITOR=micro glow ...` (or the `glowm` function) scopes the handoff to glow alone. Exporting `EDITOR`/`VISUAL` globally instead makes micro the default editor for everything that reads those variables — `git commit`, `gh pr create`, `crontab -e`, an IDE's integrated terminal — which is a bigger change than "integrate micro and glow" usually calls for.
- This same handoff applies to every doc in [docs/cli](.), not just Markdown you write for this repo.
