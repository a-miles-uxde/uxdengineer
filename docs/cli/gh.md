# gh (GitHub CLI)

## Summary

`gh` is GitHub's official command-line tool. It handles pull requests, issues, repositories, GitHub Actions runs, and releases from the terminal, so you rarely need the website. It also stores your GitHub login and hands it to `git`, so pushing over HTTPS doesn't ask for a password. On this Mac it's signed in as `a-miles-uxde`.

## Daily and weekly commands

### Daily

```sh
# See pull requests, issues, and review requests that involve you, across repos
gh status

# List open pull requests in the current repo
gh pr list

# Open a pull request for the current branch, using commit messages for title and body
gh pr create --fill

# Check out a pull request locally to test or review it
gh pr checkout <number>

# Watch the CI checks on the current branch's pull request until they finish
gh pr checks --watch

# Approve a pull request
gh pr review <number> --approve

# Squash-merge a pull request and delete its branch
gh pr merge <number> --squash --delete-branch
```

### Weekly

```sh
# Confirm you're still signed in and check the token's scopes
gh auth status

# Review the open issues assigned to you
gh issue list --assignee @me

# Look over recent GitHub Actions runs for failures
gh run list --limit 20

# Update gh itself (installed with Homebrew)
brew upgrade gh

# Update any gh extensions you've installed
gh extension upgrade --all
```

## Contents

- [Summary](#summary)
- [Daily and weekly commands](#daily-and-weekly-commands)
  - [Daily](#daily)
  - [Weekly](#weekly)
- [Common commands](#common-commands)
  - [Authentication](#authentication)
  - [Repositories](#repositories)
  - [Pull requests](#pull-requests)
  - [Issues](#issues)
  - [GitHub Actions](#github-actions)
  - [Releases](#releases)
  - [Search and browse](#search-and-browse)
  - [Gists, API, and configuration](#gists-api-and-configuration)

## Common commands

`<angle brackets>` mark placeholders. Most commands act on the repo in your current folder; add `-R <owner>/<repo>` to target another. Run `gh <command> --help` for all options.

### Authentication

| Command | What it does |
|---|---|
| `gh auth login` | Sign in to GitHub through the browser or with a token. |
| `gh auth status` | Show which accounts are signed in and their token scopes. |
| `gh auth refresh -s <scope>` | Add permission scopes to your existing login, e.g. `delete_repo`. |
| `gh auth setup-git` | Make `git` use your gh login for GitHub over HTTPS. |
| `gh auth switch` | Switch the active account when signed in to several. |
| `gh auth logout` | Sign out and remove the stored token. |

### Repositories

| Command | What it does |
|---|---|
| `gh repo create <name> --public --clone` | Create a public GitHub repo and clone it into the current folder. |
| `gh repo clone <owner>/<repo>` | Clone a GitHub repo using just its owner and name. |
| `gh repo fork <owner>/<repo> --clone` | Fork someone else's repo to your account and clone your fork. |
| `gh repo view --web` | Open the current repo on github.com. |
| `gh repo list` | List your repositories. |
| `gh repo sync` | Update a fork or local copy from the repo it came from. |
| `gh repo edit --description "<text>"` | Change the repo's description; other flags change other settings. |
| `gh repo delete <owner>/<repo>` | Permanently delete a repo on GitHub; needs the `delete_repo` scope. |

### Pull requests

| Command | What it does |
|---|---|
| `gh pr create` | Open a pull request for the current branch, prompting for details. |
| `gh pr create --draft` | Open a draft pull request that can't be merged yet. |
| `gh pr list` | List open pull requests in the repo. |
| `gh pr status` | Show your pull requests and ones requesting your review. |
| `gh pr view <number> --web` | Open a pull request in your browser. |
| `gh pr checkout <number>` | Check out a pull request's branch locally. |
| `gh pr diff <number>` | Show a pull request's changes in the terminal. |
| `gh pr checks` | Show CI check results for the current branch's pull request. |
| `gh pr review <number> --approve` | Approve a pull request. |
| `gh pr ready <number>` | Mark a draft pull request as ready for review. |
| `gh pr merge <number> --squash` | Squash-merge a pull request; `--merge` and `--rebase` are alternatives. |
| `gh pr close <number>` | Close a pull request without merging. |

### Issues

| Command | What it does |
|---|---|
| `gh issue create` | Open a new issue, prompting for title and body. |
| `gh issue list` | List open issues in the repo. |
| `gh issue list --assignee @me` | List open issues assigned to you. |
| `gh issue view <number>` | Show an issue and its comments in the terminal. |
| `gh issue comment <number> --body "<text>"` | Add a comment to an issue. |
| `gh issue develop <number> --checkout` | Create a branch linked to an issue and switch to it. |
| `gh issue close <number>` | Close an issue. |
| `gh issue reopen <number>` | Reopen a closed issue. |

### GitHub Actions

| Command | What it does |
|---|---|
| `gh run list` | List recent workflow runs and their results. |
| `gh run watch` | Follow a running workflow live until it finishes. |
| `gh run view <run-id> --log-failed` | Show logs only from the failed steps of a run. |
| `gh run rerun <run-id> --failed` | Re-run just the failed jobs of a run. |
| `gh workflow list` | List the repo's workflows. |
| `gh workflow run <workflow>` | Manually trigger a workflow that supports `workflow_dispatch`. |
| `gh secret set <name>` | Create or update an Actions secret, prompting for its value. |
| `gh cache list` | List GitHub Actions caches for the repo. |

### Releases

| Command | What it does |
|---|---|
| `gh release create <tag> --generate-notes` | Create a release, auto-writing notes from merged pull requests. |
| `gh release list` | List the repo's releases. |
| `gh release view <tag>` | Show a release's notes and assets. |
| `gh release download <tag>` | Download a release's asset files. |

### Search and browse

| Command | What it does |
|---|---|
| `gh browse` | Open the current repo in your browser. |
| `gh browse <file>` | Open a specific file from the repo on github.com. |
| `gh search repos <query>` | Search all of GitHub for repositories. |
| `gh search issues <query>` | Search issues across GitHub. |
| `gh search prs <query>` | Search pull requests across GitHub. |

### Gists, API, and configuration

| Command | What it does |
|---|---|
| `gh gist create <file>` | Upload a file as a secret gist; add `--public` to share it publicly. |
| `gh api <endpoint>` | Call any GitHub REST API endpoint using your login, e.g. `user`. |
| `gh alias set <alias> '<expansion>'` | Create a shortcut, e.g. `gh alias set mine 'pr list --author @me'`. |
| `gh extension install <owner>/<repo>` | Install a community extension that adds new gh commands. |
| `gh config set editor <editor>` | Choose the editor gh opens for writing text, e.g. `nano`. |
