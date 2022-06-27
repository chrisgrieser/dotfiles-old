#!/usr/bin/env zsh
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH

#-------------------------------------------------------------------------------
# CONFIG

PREVIEW_CONFIG=~/.config/alacritty/preview-window.yml
BG_COLOR=#303643
STATUSLINE_COLOR=#859DC5
STYLE=paraiso-dark # https://cheat.sh/:styles-demo
REMOVE_SIGNATURE=false

#-------------------------------------------------------------------------------

QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT_INFO=$(curl -s "https://cht.sh/$QUERY?style=$STYLE") # https://cht.sh/:help
[[ $REMOVE_SIGNATURE ]] && CHEAT_INFO=$(echo "$CHEAT_INFO" | sed '/\] \[cc/d')
CHEAT_CODE_ONLY=$(curl -s "https://cht.sh/$QUERY?TQ")

echo "$CHEAT_CODE_ONLY" | pbcopy

CLEAN_QUERY=$(echo "$*" | tr "/" " ")
CACHE="/tmp/$CLEAN_QUERY" # will be displayed in less prompt line at start
echo "$CHEAT_INFO" >> "$CACHE"

alacritty \
	--config-file="$PREVIEW_CONFIG" \
	--option="colors.primary.background='$BG_COLOR'" \
	--option="colors.primary.foreground='$STATUSLINE_COLOR'" \
	--command less -R \
		--long-prompt \
		--window=-4 \
		--incsearch \
		--ignore-case \
		--HILITE-UNREAD \
		--tilde \
		-- "$CACHE"

