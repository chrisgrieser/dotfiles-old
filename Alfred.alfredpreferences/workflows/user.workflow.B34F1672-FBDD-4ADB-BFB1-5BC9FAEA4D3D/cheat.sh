#!/usr/bin/env zsh
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH

QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT_INFO=$(curl -s "https://cht.sh/$QUERY?T") # https://cht.sh/:help
CHEAT_CODE_ONLY=$(curl -s "https://cht.sh/$QUERY?TQ")

# copy to clipboard
echo "$CHEAT_CODE_ONLY" | pbcopy

LANG="sh"
if [[ "$QUERY" =~ "/" ]] ; then
	LANG=$(echo "$QUERY" | cut -d"/" -f1)
	QUERY=$(echo "$QUERY" | cut -d"/" -f2- | tr "+" " ")
fi

CACHE=~"/Library/Caches/$QUERY.$LANG"
echo "$CHEAT_INFO" > "$CACHE"
# view in Terminal
alacritty \
	--option=window.decorations=full \
	--title="$LANG: $QUERY" \
	--option="dimen" \
	--command bat "$CACHE" \
		--pager="less -R --quit-at-eof" \
		--language="$LANG" \
		--style=numbers

#-------------------------------------------------------------------------------
# # quicklook preview via Peek
# # shellcheck disable=SC2154
# [[ ! -d "$alfred_workflow_cache" ]] && mkdir -p "$alfred_workflow_cache"
# CACHE="$alfred_workflow_cache/$QUERY.$LANG"
# echo "$CHEAT" > "$CACHE"
# killall "qlmanage" # remove existing quicklook previews
# qlmanage -p "$CACHE"
