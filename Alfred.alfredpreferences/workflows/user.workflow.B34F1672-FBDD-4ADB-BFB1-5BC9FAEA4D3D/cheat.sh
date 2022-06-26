#!/usr/bin/env zsh
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH

QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT=$(curl -s "https://cht.sh/$QUERY?T") # https://cht.sh/:help

# copy to clipboard
echo "$CHEAT" | pbcopy

LANG="sh"
if [[ "$QUERY" =~ "/" ]] ; then
	LANG=$(echo "$QUERY" | cut -d"/" -f1)
	QUERY=$(echo "$QUERY" | cut -d"/" -f2-)
fi

CACHE=~"/Library/Caches/$QUERY.$LANG"
echo "$CHEAT" > "$CACHE"
# view in Terminal
alacritty \
	--option=window.decorations=full \
	--title="$LANG: $QUERY" \
	--command=bat $CACHE


#-------------------------------------------------------------------------------
# # quicklook preview via Peek
# # shellcheck disable=SC2154
# [[ ! -d "$alfred_workflow_cache" ]] && mkdir -p "$alfred_workflow_cache"
# CACHE="$alfred_workflow_cache/$QUERY.$LANG"
# echo "$CHEAT" > "$CACHE"
# killall "qlmanage" # remove existing quicklook previews
# qlmanage -p "$CACHE"
