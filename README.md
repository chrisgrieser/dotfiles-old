# pseudometa's dotfiles

## Table of Contents
<!-- MarkdownTOC -->

- [What are "dotfiles"?](#what-are-dotfiles)
- [Why this repository?](#why-this-repository)
- [Special Explanations](#special-explanations)
- [How this Repository works](#how-this-repository-works)
- [Got an idea for an improvement?](#got-an-idea-for-an-improvement)
- [Contact](#contact)

<!-- /MarkdownTOC -->
## What are "dotfiles"?
Read this excellent [primer on freecodecamp what dotfiles are](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/).

## Why this repository?
- These files are symlinked into a cloud drive for synchronization.
- They uploaded to git for backups and version history.
- A public GitHub repository also enables easier sharing of individual configuration with others

## Special Explanations
- The `CSS3` Sublime Package has to be symlinked and cannot be installed automatically via listing in Package Control settings, since I modified it manually. (Removing autocompletions to avoid overlap with the `lsp-css` package.)
- The fig settings are "inactive" since they cannot be properly symlinked [until a bug with Fig is fixed](https://github.com/withfig/fig/issues/693).
- I don't use a zsh-framework, since most zsh plugins are honestly little more than a few lines to be copypasted, I essentially go [zsh unplugged](https://github.com/mattmc3/zsh_unplugged).

## How this Repository works
These files only exist for the purpose of backup:
- `crontab` on my main machine [is configured](Cron%20Jobs/30-min.sh) to run the script [30-min.sh](Cron%20Jobs/30-min.sh) every 30 minutes.
- [30-min.sh](Cron%20Jobs/30-min.sh) runs various tasks that should run regularly, one of them is to trigger the shell script [git-dotfile-backup.sh](git-dotfile-backup.sh).
- [git-dotfile-backup.sh](git-dotfile-backup.sh) checks whether there have been any changes in dot files. If there are, it creates somewhat useful commit messages and runs the `git add commit pull push` sequence.
- [.gitignore](.gitignore) contains a list of files not to backups for various reasons, e.g. redundancy, privacy, or simply because they are too big for a git repo.

## Got an idea for an improvement?
Feel free to [open an issue](https://github.com/chrisgrieser/dotfiles/issues) to suggest an improvement to my settings! :blush:

## Contact
- [Academic Website](https://chris-grieser.de/)
- [GitHub](https://github.com/chrisgrieser/)
- [Twitter](https://twitter.com/pseudo_meta)
- Discord: `@pseudometa#9546`
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)
