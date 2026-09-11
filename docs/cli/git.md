# git

## Summary

Git is version control. It records snapshots of your project as commits, lets you work on separate branches, and syncs your work with remote copies such as GitHub. This Mac uses Homebrew's git (`/opt/homebrew/bin/git`), your name and email are set globally, and new repos start on `main`. Run `git config --global --list` to see those settings.

## Daily and weekly commands

### Daily

```sh
# Start the day with the latest changes from GitHub
git pull

# See which files changed and what's staged for the next commit
git status

# Review your unstaged changes line by line
git diff

# Create a branch for a new piece of work and switch to it
git switch -c <branch>

# Stage the files you want in the next commit
git add <file>

# Record the staged changes with a message
git commit -m "Describe the change"

# Upload the branch; -u links it to GitHub so later pushes are just `git push`
git push -u origin <branch>
```

### Weekly

```sh
# Download all remote updates and forget branches deleted on GitHub
git fetch --all --prune

# Bring a long-running branch up to date with main
git switch <branch>
git rebase origin/main        # or: git merge origin/main

# List local branches already merged into main (safe to delete)
git branch --merged main

# Delete a merged local branch
git branch -d <branch>

# Look back at the week's commits
git log --oneline --since="1 week ago"

# Check for stashed work you forgot about
git stash list
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Setup and config](#setup-and-config)
  - [Everyday changes](#everyday-changes)
  - [Branches](#branches)
  - [Viewing history](#viewing-history)
  - [Remotes and syncing](#remotes-and-syncing)
  - [Undoing things](#undoing-things)
  - [Tags](#tags)

## Common commands

`<angle brackets>` mark placeholders. Run `git help <command>` for all options.

### Setup and config

| Command | What it does |
|---|---|
| `git config --global user.name "<name>"` | Set the author name recorded on your commits. |
| `git config --global user.email "<email>"` | Set the author email recorded on your commits. |
| `git config --global --list` | Show all your global git settings. |
| `git init` | Turn the current folder into a new git repository. |
| `git clone <url>` | Copy a remote repository, with full history, into a new folder. |

### Everyday changes

| Command | What it does |
|---|---|
| `git status` | Show changed, staged, and untracked files. |
| `git add <file>` | Stage a file's changes for the next commit. |
| `git add -p` | Choose individual chunks of changes to stage, one at a time. |
| `git add .` | Stage all changes in the current folder and below. |
| `git commit -m "<message>"` | Commit staged changes with a message. |
| `git commit --amend` | Add staged changes to the last commit, or edit its message. |
| `git restore <file>` | Discard unstaged changes to a file; they can't be recovered. |
| `git restore --staged <file>` | Unstage a file but keep its changes. |
| `git rm <file>` | Delete a file and stage the deletion. |
| `git mv <old> <new>` | Rename or move a file and stage the change. |

### Branches

| Command | What it does |
|---|---|
| `git branch` | List local branches; the current one is marked with `*`. |
| `git branch -a` | List local and remote-tracking branches. |
| `git switch <branch>` | Switch to an existing branch. |
| `git switch -c <branch>` | Create a new branch and switch to it. |
| `git merge <branch>` | Merge another branch's commits into the current branch. |
| `git rebase <branch>` | Replay your commits on top of another branch for a linear history. |
| `git branch -d <branch>` | Delete a branch that has been merged. |
| `git branch -D <branch>` | Force-delete a branch, even with unmerged commits. |

### Viewing history

| Command | What it does |
|---|---|
| `git log --oneline --graph` | Show commit history compactly, with a branch graph. |
| `git log -p <file>` | Show every change made to a file, commit by commit. |
| `git show <commit>` | Show a commit's message and changes. |
| `git diff` | Show unstaged changes. |
| `git diff --staged` | Show staged changes that will go into the next commit. |
| `git diff main...<branch>` | Show what a branch changed since it split from main. |
| `git blame <file>` | Show who last changed each line of a file, and when. |
| `git reflog` | List where HEAD has been; helps recover "lost" commits. |

### Remotes and syncing

| Command | What it does |
|---|---|
| `git remote -v` | List remotes and their URLs. |
| `git remote add origin <url>` | Connect a local repo to a remote named `origin`. |
| `git fetch` | Download new commits from the remote without changing your files. |
| `git pull` | Fetch and merge remote changes into the current branch. |
| `git pull --rebase` | Fetch and replay your local commits on top of remote changes. |
| `git push` | Upload your commits to the remote branch. |
| `git push -u origin <branch>` | Push a new branch and set it to track the remote. |
| `git push --force-with-lease` | Overwrite the remote branch after a rebase, unless someone else pushed. |

### Undoing things

| Command | What it does |
|---|---|
| `git revert <commit>` | Make a new commit that undoes an earlier one; safe for shared history. |
| `git reset --soft HEAD~1` | Undo the last commit but keep its changes staged. |
| `git reset --hard <commit>` | Move the branch to a commit and discard all uncommitted changes. |
| `git stash` | Set aside uncommitted changes so you can switch tasks. |
| `git stash pop` | Reapply the most recent stash and remove it from the list. |
| `git clean -n` | Preview which untracked files `git clean -f` would delete. |

### Tags

| Command | What it does |
|---|---|
| `git tag` | List tags. |
| `git tag -a <tag> -m "<message>"` | Create an annotated tag, typically marking a release version. |
| `git push origin <tag>` | Upload one tag to the remote. |
| `git push --tags` | Upload all local tags to the remote. |
