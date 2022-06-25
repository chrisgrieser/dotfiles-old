#!/usr/bin/env zsh
QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT_INFO=$(curl -s "https://cht.sh/$QUERY?Tq") # https://cht.sh/:help
CHEAT_CODE_ONLY=$(curl -s "https://cht.sh/$QUERY?TqQ")

# copy to clipboard
echo "$CHEAT_CODE_ONLY" | pbcopy

# highlighted preview window via Peek
LANG="sh"
if [[ "$QUERY" =~ "/" ]] ; then
	LANG=$(echo "$QUERY" | cut -d"/" -f1)
	QUERY=$(echo "$QUERY" | cut -d"/" -f2- | tr "+" " ")
fi
# shellcheck disable=SC2154
[[ ! -d "$alfred_workflow_cache" ]] && mkdir -p "$alfred_workflow_cache"
CACHE="$alfred_workflow_cache/$QUERY.$LANG"
echo "$CHEAT_INFO" > "$CACHE"
killall "qlmanage" # remove existing quicklook previews
qlmanage -p "$CACHE"
