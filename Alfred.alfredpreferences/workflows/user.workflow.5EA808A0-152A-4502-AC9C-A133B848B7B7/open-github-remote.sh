#!/bin/zsh

# get path of current Finder Selection/Window
FINDER_SEL=$(osascript -e 'tell application "Finder"
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

[[ "$FINDER_SEL" == "no window" ]] && exit 1 # no finder window
[[ $(git rev-parse --git-dir) ]] || exit 1 # not a git directory

if [[ -d "$FINDER_SEL" ]] ; then
	FOLDER="$FINDER_SEL"
	FILE=""
elif [[ -f "$FINDER_SEL" ]] ; then
	FOLDER=$(dirname "$FINDER_SEL")
	FILE=$(basename "$FINDER_SEL")
else
	exit 1 # no regular file selected
fi

cd "$FOLDER" || return
# go to to git root https://stackoverflow.com/a/38843585
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && ROOTF="${r%%/.git/*}" &&

REMOTE_URL="$(git remote -v | grep git@github.com | grep fetch | head -n1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/https:\/\//' -e 's/\.git//')"

# shellcheck disable=SC2053
if [[ "$ROOTF" == "$FOLDER" ]] ; then
	if [[ -z "$FILE" ]] ; then
		URL="$REMOTE_URL"
	else
		URL="$REMOTE_URL/blob/main/$FILE"
	fi
else
	ROOTF_LEN=${#ROOTF}
	# shellcheck disable=SC2086
	SUBFOLDER=$(echo "$FOLDER" | cut -c -$ROOTF_LEN)
	if [[ -z "$FILE" ]] ; then
		URL="$REMOTE_URL/tree/main/$SUBFOLDER"
	else
		URL="$REMOTE_URL/blob/main/$SUBFOLDER/$FILE"
	fi
fi

# open pseudo-encoded url
open "$(echo "$URL" | sed -e "s/ /%20/")"
