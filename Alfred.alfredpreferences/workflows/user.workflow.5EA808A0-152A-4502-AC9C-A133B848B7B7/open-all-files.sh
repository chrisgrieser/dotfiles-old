#!/bin/zsh

# get path of current Finder Selection/Window
FINDER_SEL=$(osascript -e 'tell application "Finder"
	set sel to selection
	if ((count sel) > 1) then return POSIX path of ((item 1 of sel) as text)
	if ((count sel) = 1) then return POSIX path of (sel as text)
	if ((count sel) = 0) then return "no selection"
end tell')

[[ "$FINDER_SEL" == "no selection" ]] && exit 1 # no finder window

if [[ -d "$FINDER_SEL" ]] ; then
	FOLDER="$FINDER_SEL"
	FILE=""
elif [[ -f "$FINDER_SEL" ]] ; then
	FOLDER=$(dirname "$FINDER_SEL")
	FILE=$(basename "$FINDER_SEL")
else
	exit 1 # no regular file selected
fi

cd "$FOLDER" || exit 1
[[ $(git rev-parse --git-dir) ]] || exit 1 # not a git directory
# go to to git root https://stackoverflow.com/a/38843585
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && ROOTF="${r%%/.git/*}"

