#!/bin/zsh

# get path of current Finder Selection/Window
FINDER_SEL=$(osascript -e 'tell application "Finder"
	set sel to selection
	if ((count sel) > 1) then return POSIX path of ((item 1 of sel) as text)
	if ((count sel) = 1) then return POSIX path of (sel as text)
	if ((count sel) = 0) then return "no selection"
end tell')

[[ "$FINDER_SEL" == "no selection" ]] && exit 1 # no finder window
[[ -d "$FINDER_SEL" ]] && exit 1 # folder selected

FOLDER=$(dirname "$FINDER_SEL")
FILE=$(basename "$FINDER_SEL")

cd "$FOLDER" || exit 1
[[ $(git rev-parse --git-dir) ]] || exit 1 # not a git directory
# shellcheck disable=SC2164
r=$(git rev-parse --git-dir) && r=$(cd "$r" && pwd)/ && ROOTF="${r%%/.git/*}"

#-------------------------------------------------------------------------------

# https://stackoverflow.com/questions/1964142/how-can-i-list-all-the-different-versions-of-a-file-and-diff-them-also/32849134#32849134
function allversions () {
	for commit_hash in $(git log --pretty=format:%h "$1") ; do
		file_path="$1"
		path_no_ext="${file_path%.*}"
		ext="${file_path##*.}"

		padindex=$(printf %03d "$index")
		date=$(git show -s --format=%ci $commit_hash | )
		out="$path_no_ext.$padindex.$commit_hash.$ext"

		git show "$commit_hash:./$file_path" > "$out"
	done
}

allversions "$FILE"
