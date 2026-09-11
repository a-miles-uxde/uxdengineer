---
title: "Article N: Folder Manifest"
type: manifest
status: active
created: YYYY-MM-DD
updated: YYYY-MM-DD
summary: What's actually in this article's folder, kept current as the folder changes.
---

# Article N: Folder Manifest

Defines what's in this article folder. "Root" below means this article folder, not the repository root. See `templates/article-directory-spec.md` for the conventions this follows.

## Top level

| Path | Type | Purpose |
| --- | --- | --- |
| `outline.md` | file | Working outline for the article. |
| `manifest.md` | file | This file. |
| `img/` | dir | Screenshots, plus `readme.md`. Created even if empty. |
| `sessions/` | dir | Session-log evidence files, plus `readme.md`. Created even if empty. |
| `transcripts/` | dir | Cleaned personal transcripts specific to this article. Created even if empty. |
| `working-files/` | dir | Active in-progress working material (e.g. `research-brief.md`). Created even if empty. |
| `misplaced/` | dir | Inherited/unsorted material pending triage. <!-- Remove this row if not present. --> Not part of the standard shape — see `templates/article-directory-spec.md`. |

<!-- Add a row for anything else actually present, and delete any row above that isn't. -->

## `img/`

<!-- What's captured, what naming pattern the files follow, anything non-obvious. -->

## `sessions/`

<!-- What's here, raw vs. cleaned, anything non-obvious. -->

## `transcripts/`

<!-- What's here, anything non-obvious. -->

<!-- If misplaced/ is present, describe its contents and open questions here, the way
     articles/260910-from-zero/manifest.md does — table of what moved in, known issues,
     anything that looks like it belongs elsewhere in the repo entirely. -->

## Open questions

<!-- Anything this manifest surfaces that isn't resolved yet: naming inconsistencies,
     files that don't fit a category, things worth triaging out of misplaced/. Remove
     this section if there's nothing open. -->
