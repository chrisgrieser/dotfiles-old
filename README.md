# pseudometa's dotfiles

## Table of Contents
<!-- MarkdownTOC -->

- [What are "dotfiles"?](#what-are-dotfiles)
- [Why this repository?](#why-this-repository)
- [How this repository works](#how-this-repository-works)
- [Got an idea for an improvement?](#got-an-idea-for-an-improvement)
- [About Me](#about-me)
	- [Profiles](#profiles)
	- [Donate](#donate)

<!-- /MarkdownTOC -->
## What are "dotfiles"?
- Read this excellent [primer on freecodecamp what dotfiles are](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/).
- Here is an interesting [report on common contents of dotfiles](https://github.com/Kharacternyk/dotcommon).

## Why this repository?
- These files are symlinked into iCloud for synchronization and uploaded to git for backup and version history.
- A public GitHub repository also enables easy sharing of individual configuration with others.

## How this repository works
- `crontab` on my main machine [is configured](Cron%20Jobs/30-min.sh) to run the script [30-min.sh](Cron%20Jobs/30-min.sh) every 30 minutes.
- [30-min.sh](Cron%20Jobs/30-min.sh) runs various tasks that should run regularly, one of them is to trigger the shell script [git-dotfile-backup.sh](git-dotfile-backup.sh).
- [git-dotfile-backup.sh](git-dotfile-backup.sh) checks whether there have been any changes in dot files. If there are, it creates somewhat useful commit messages and runs the `git add commit pull push` sequence.
- [.gitignore](.gitignore) contains a list of files not to backups for various reasons, e.g. redundancy, privacy, or simply because they are too big for a git repo.

## Got an idea for an improvement?
Feel free to [open an issue](https://github.com/chrisgrieser/dotfiles/issues) to suggest an improvement to my settings! :blush:

## About Me
In my day job, I am a sociologist studying the social mechanisms underlying the digital economy. For my PhD project, I investigate the governance of the app economy and how software ecosystems manage the tension between innovation and compatibility. If you are interested in this subject, feel free to get in touch!

<!-- markdown-link-check-disable -->

### Profiles
- [Discord](https://discordapp.com/users/462774483044794368/)
- [Academic Website](https://chris-grieser.de/)
- [GitHub](https://github.com/chrisgrieser/)
- [Twitter](https://twitter.com/pseudo_meta)
- [ResearchGate](https://www.researchgate.net/profile/Christopher-Grieser)
- [LinkedIn](https://www.linkedin.com/in/christopher-grieser-ba693b17a/)

### Donate
<a href='https://ko-fi.com/Y8Y86SQ91' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
