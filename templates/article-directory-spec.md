---
title: Article Directory Specification
type: spec
status: active
created: 2026-09-11
updated: 2026-09-11
summary: The standard organization and content types for an article directory under articles/, for reference when creating new ones.
---

# Article Directory Specification

Standard shape for a single article's working directory under `articles/`. Applied first to `articles/260910-from-zero/` on 2026-09-11; use that folder as the worked example alongside this spec.

## Article folder naming

`{YYMMDD}-{slug-in-kebab-case}`, dated to when work on the article started (e.g. `260910-from-zero`).

## File naming, within an article folder

New or moved files: `{YYMMDD-hhmmss}-{name-in-kebab-case}.*`, timestamped to when the thing itself happened (a session, a capture, a note) — not when the file was added to the folder. `readme.md` is a reserved name and is never timestamped. A file that's already correctly placed keeps its existing name; this convention governs new and moved files going forward.

## Frontmatter

Every markdown file in an article folder (except `readme.md`, which typically skips it) opens with:

```yaml
---
title: "Article N: <thing>"
type: <outline | checklist | readme | manifest | prompts | spec | ...>
status: <draft | active | ...>
created: YYYY-MM-DD
updated: YYYY-MM-DD
summary: One sentence — what this file is and what it's for.
---
```

## Standard contents

| Path | Type | Purpose |
| --- | --- | --- |
| `outline.md` | file | Working outline — reader questions, reader takeaways, the step-by-step outline itself. |
| `manifest.md` | file | This article's own manifest: what's actually in its folder, kept current as the folder changes. |
| `img/` | dir | Numbered screenshots for the article, plus `readme.md` tracking what's captured, what's missing, and capture guards. |
| `sessions/` | dir | Raw session-log evidence files (unedited transcripts a claim in `outline.md` can be checked against), plus `readme.md`. |
| `transcripts/` | dir | Cleaned, personal transcripts specific to this article's research and drafting. |
| `working-files/` | dir | Active in-progress working material. Empty is normal — it only holds something when work is actually in progress. |

## `img/` contents

PNGs named `<date>-<time>-<step-number>-<slug>.png`, step numbers matching the outline. `readme.md` (type: `checklist`) tracks capture status against the outline's steps.

## `sessions/` contents

Raw session logs named per the file-naming convention above. `readme.md` (type: `readme`) explains what belongs here versus in `transcripts/`.

## Not part of the standard shape

A folder inherited from before this spec, or scratch material that hasn't been sorted yet, does not get invented structure to fit in. Put it in a `misplaced/` directory instead and leave it alone until it's actually triaged — don't rename or reorganize its contents just to make it look tidy. `articles/260910-from-zero/misplaced/` is the working example.

## When creating a new article folder

1. Name it `{YYMMDD}-{slug}`.
2. Add `outline.md` and `manifest.md` first.
3. Add `img/`, `sessions/`, `transcripts/`, `working-files/` as they're actually needed — don't pre-create empty ones speculatively beyond `working-files/`, which is expected to start empty.
4. Give every subdirectory that holds more than a couple of files a `readme.md`.
