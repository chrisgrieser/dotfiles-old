#!/usr/bin/env zsh
QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT=$(curl -s "https://cht.sh/$QUERY?Tq") # https://cht.sh/:help

# copy to clipboard
echo "$CHEAT" | pbcopy

LANG="sh"
if [[ "$QUERY" =~ "/" ]] ; then
	LANG=$(echo "$QUERY" | cut -d"/" -f1)
	QUERY=$(echo "$QUERY" | cut -d"/" -f2- | tr "+" " ")
fi

# view in Terminal
alacritty \
	--option=window.decorations=full \
	--title="$LANG: $QUERY" \
	--command="echo $CHEAT | $PAGER"


alacritty --command man fd

#-------------------------------------------------------------------------------
# # quicklook preview via Peek
# # shellcheck disable=SC2154
# [[ ! -d "$alfred_workflow_cache" ]] && mkdir -p "$alfred_workflow_cache"
# CACHE="$alfred_workflow_cache/$QUERY.$LANG"
# echo "$CHEAT" > "$CACHE"
# killall "qlmanage" # remove existing quicklook previews
# qlmanage -p "$CACHE"
