# Micro/Glow Tooling Install and Docs Integration

## User

Install micro, glow, sublime, obsidian, and vs code using homebrew. Add files for micro and glow in docs/cli using the same format as the existing files, add the 3 applications to the MacOS dock.

## Assistant

VS Code is already installed. I'll install the rest: micro, glow (formulae), and sublime-text, obsidian (casks).

All five installed successfully (VS Code was already present). Now let's get version/path details for the docs and check micro/glow info for content.

Now let's add the three apps to the macOS Dock.

Good — Sublime Text and Obsidian are real, fully-installed app bundles. VS Code's cask, however, is a stub with no actual bundle. Let me add the two real apps to the Dock now, and check VS Code's situation more before deciding how to handle it.

That fixed it — the reinstall properly placed the app bundle this time.

All three app bundles now exist properly. Now adding them to the Dock.

Everything's done:

- Installed via Homebrew: micro, glow, Sublime Text, Obsidian (VS Code was already installed, but its app bundle was missing — a reinstall fixed that).
- Docs added: docs/cli/micro.md and docs/cli/glow.md, matching the format of the existing brew.md/gh.md/git.md/herdr.md (summary, daily/weekly commands, TOC, categorized command tables).
- Dock: Sublime Text, Obsidian, and Visual Studio Code are now pinned to the Dock (verified in com.apple.dock persistent-apps).

The two new doc files are untracked in git — let me know if you'd like them committed.

## User

Commit and push

## Assistant

Committed and pushed to main (2c55afd).

## User

Create a README.md for docs/cli, then create docs/reference and make duplicate the README.md file there, make versions using .json and .xml adding front matter to all three as appropriate.

## Assistant

Now creating docs/reference with the three format variants, each carrying front matter appropriate to its format.

Both validate. Here's what was created:

- docs/cli/README.md — index of the six CLI docs (brew, gh, git, glow, herdr, micro).
- docs/reference/README.md — duplicate of that index with YAML front matter (title, description, format, source).
- docs/reference/README.json — same content as structured JSON, with a frontMatter object mirroring those same fields.
- docs/reference/README.xml — same content as XML, with a `<frontMatter>` element.

Links in docs/reference point back to `../cli/*.md` since the source docs live there. Want me to commit and push these?

## User

Create a document in docs/cli that is specific to the roles micro and glow play in a CLI environment together and how to "integrate" them.

## Assistant

Neither is set currently, so I'll cover that as part of the setup. Writing the doc now.

Created docs/cli/micro-and-glow.md, covering:

- The pairing: glow renders Markdown (read-only), micro edits it — complementary rather than overlapping tools.
- The actual integration mechanism: setting $EDITOR/$VISUAL to micro, which makes glow's `e` pager key shell out to micro for editing, then return to the rendered view on save/quit.
- Daily/weekly workflow examples, a quick why-it-works table, and an honest note that there's no plugin linking them — $EDITOR is the whole mechanism (verified `micro -plugin available` has nothing glow-related).

Also added it to docs/cli/README.md's index so it's discoverable alongside the individual tool docs. Let me know if you'd like this committed and pushed.

## User

Is The actual integration mechanism: setting $EDITOR/$VISUAL to micro specific to glow/micro or will it impact other applications?

## Assistant

No — $EDITOR/$VISUAL are a general Unix convention, not something glow or micro invented. Setting them in your shell profile affects any CLI tool that checks those variables, including several already covered in this repo's docs:

- git: `git commit` (no -m), `git rebase -i`, `git commit --amend`, `git config --global --edit`
- gh: `gh pr create`/`gh pr edit`, `gh issue create`, `gh config set editor` overrides it specifically for gh
- `crontab -e`, `sudoedit`/`visudo`
- Pagers like `less` (the `v` key opens the current file in $EDITOR) — this is the same mechanism glow's `e` key uses
- Many other CLIs and REPLs that shell out for multi-line input

So `export EDITOR=micro` doesn't just wire up glow — it makes micro the default editor everywhere on the system that respects the convention. That's worth knowing before setting it, especially if you're used to vim/nano opening for `git commit` and would be surprised by micro popping up instead.

Want me to add a short callout in micro-and-glow.md making this system-wide scope explicit, rather than leaving it implied by the `git commit`/`gh pr create` mention?

## User

How can we integrate the two without altering the behavior of other systems, for example an IDE that is initiating the process for a commit message.

## Assistant

The fix is to stop exporting EDITOR/VISUAL globally and instead set them only for the single command that needs the link — env vars only affect the process they're set on (and its children), not the whole shell session or other programs that spawn from a different context (like an IDE's own commit UI or its integrated terminal).

Concretely: `EDITOR=micro glow file.md` sets EDITOR for that one invocation of glow and nothing else. Wrapping it in an alias or function makes it convenient without ever touching your global environment:

```sh
# ~/.zshrc — no `export`, so nothing outside this function sees it
glowm() {
  EDITOR=micro VISUAL=micro glow "$@"
}
```

Now `glowm docs/cli/micro.md` gets the micro handoff on `e`, but:

- `git commit` run directly, or from an IDE's integrated terminal, still uses whatever editor it already used.
- An IDE's own commit-message UI (VS Code's, etc.) doesn't shell out to $EDITOR at all in most cases — it has its own built-in input — so it's unaffected either way, but this approach means it's unaffected even if it does.
- gh, `crontab -e`, `sudoedit`, and anything else that reads $EDITOR keeps its current behavior everywhere else.

Let me update micro-and-glow.md's setup section to this scoped approach instead of the global export.

Now let's update the rest of the doc to match the scoped glowm approach rather than referring to a bare global $EDITOR.

I've updated docs/cli/micro-and-glow.md to recommend the scoped approach instead of a global export:

- Setup now uses a `glowm()` shell function that sets `EDITOR=micro` only for that one glow invocation, rather than `export EDITOR=micro` in the shell profile. Env vars set that way only apply to the command they prefix (and its children) — they never touch the surrounding shell or other programs, so an IDE's integrated terminal or built-in commit UI is unaffected.
- Updated the daily-workflow examples and notes to use `glowm` instead of bare `glow`, and added a note in "Notes" explicitly calling out the global-vs-scoped tradeoff.
- Kept a one-line mention of the global option for anyone who wants micro as their systemwide editor, but framed it as a separate, bigger decision.

Not yet committed — want me to commit and push these changes along with the earlier docs/cli/README.md and docs/reference/ additions?

## User

Make the appropriate updates to enable the glow/micro specific inegration, ensure all of the files in docs/ have been udpated appropraitely, then commit and push.

## Assistant

I'll add the glowm function to ~/.zshrc since it's the interactive shell config where aliases/functions belong (not ~/.zprofile, which is login-shell env setup).

Now let's verify it actually works in a fresh shell.

The function loads and resolves correctly. Now let's do a final review of the full docs/ tree for consistency before committing.

docs/reference/README.* are mirrors of docs/cli/README.md, which now includes the micro-and-glow.md entry — I need to sync those three files too.

Both still validate. Now committing and pushing.

Done. Summary:

- Enabled the integration: added a `glowm()` function to ~/.zshrc (not ~/.zprofile, which is login-shell env setup) that sets `EDITOR=micro`/`VISUAL=micro` only for that one glow call. Verified it loads and resolves correctly in a fresh interactive shell — no global $EDITOR was touched, so `git commit`, gh, IDE terminals, etc. are unaffected.
- Synced docs/: docs/reference/README.{md,json,xml} were mirrors of docs/cli/README.md and had fallen out of date after the micro-and-glow.md entry was added there — added the matching row/entry to all three, and re-validated the JSON and XML parse cleanly.
- Committed and pushed to main (3405b8f).
