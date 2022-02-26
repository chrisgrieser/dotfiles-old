#!/bin/zsh

# get path of current Finder Window
finderPath=$(osascript -e 'tell application "Finder"
	if (count windows) is 0 then
		set pathToOpen to (path to home folder as string)
	else
		set pathToOpen to target of Finder window 1 as alias
	end if
end tell
return (POSIX path of pathToOpen)')
cd "$finderPath" || return

# go to to git root https://stackoverflow.com/a/38843585
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"

# open at GitHub
open "$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//')"
