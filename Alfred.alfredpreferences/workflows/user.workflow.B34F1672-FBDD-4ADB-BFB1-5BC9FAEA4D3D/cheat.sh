#!/usr/bin/env zsh
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH

#-------------------------------------------------------------------------------
# CONFIG

PREVIEW_CONFIG=~/.config/alacritty/preview-window.yml
BG_COLOR=#262733
STATUSLINE_COLOR=#5E6F8A
STYLE=paraiso-dark # https://cheat.sh/:styles-demo
REMOVE_SIGNATURE=false

#-------------------------------------------------------------------------------

QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT_INFO=$(curl -s "https://cht.sh/$QUERY?style=$STYLE") # https://cht.sh/:help
CHEAT_CODE_ONLY=$(curl -s "https://cht.sh/$QUERY?TQ")

[[ $REMOVE_SIGNATURE ]] && CHEAT_INFO=$(echo "$CHEAT_INFO" | sed '/\] \[cc/d')

## copy link & code only into clipboard history
echo "https://cht.sh/$QUERY" | pbcopy
echo "$CHEAT_CODE_ONLY" | pbcopy

LANG="sh"
if [[ "$QUERY" =~ "/" ]] ; then
	LANG=$(echo "$QUERY" | cut -d"/" -f1)
	QUERY=$(echo "$QUERY" | cut -d"/" -f2- | tr "+" " ")
fi

CACHE="/tmp/$LANG — $QUERY"
echo "${LANG:u} — $QUERY" > "$CACHE" # header bar
echo "" >> "$CACHE"
echo "$CHEAT_INFO" >> "$CACHE"

alacritty \
	--config-file="$PREVIEW_CONFIG" \
	--option="colors.primary.background='$BG_COLOR'" \
	--option="colors.primary.foreground='$STATUSLINE_COLOR'" \
	--command less -R \
		--long-prompt +jj\
		--window=-4 \
		--incsearch \
		--ignore-case \
		--HILITE-UNREAD \
		--tilde \
		-- "$CACHE"

rm "$CACHE"

