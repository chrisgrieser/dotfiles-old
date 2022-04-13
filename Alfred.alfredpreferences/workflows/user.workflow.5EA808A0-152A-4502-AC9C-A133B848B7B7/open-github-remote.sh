#!/bin/zsh

# get path of current Finder Selection/Window
FINDER_SELECTION=$(osascript -e 'tell application "Finder"
	set sel to selection
	if ((count sel) > 1) then
		POSIX path of ((item 1 of sel) as text)
	else if ((count sel) = 1) then
		return POSIX path of (sel as text)
	else if (count windows) is 0 then
		return "no window"
	end if
	return POSIX path of (target of window 1 as alias)
end tell')

cd "$finderPath" || return

# go to to git root https://stackoverflow.com/a/38843585
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && cd "${r%%/.git/*}"


# open at GitHub
open "$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//')"
