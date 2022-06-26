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

#-------------------------------------------------------------------------------
# PREVIEW VIA BAT
PREVIEW_CONFIG=~/.config/alacritty/preview-window.yml
BG_COLOR=#303643
BAT_SYNTAX_THEME="Nord"
# `bat --list-themes`

alacritty \
	--config-file="$PREVIEW_CONFIG" \
	--option="colors.primary.background='$BG_COLOR'" \
	--title="Cheat Sheet"\
	--command bat "$CACHE" \
		--file-name="$LANG – $QUERY" \
		--language="$LANG" \
		--theme="$BAT_SYNTAX_THEME" \
		--style=header \
		--pager="less -R --long-prompt +Gg --window=-6 --incsearch"
# the pager options needs to be set explicitly, as without
# bat sets "quit-if-one-screen" as a less option, closing most cheatsheets
# causing alacritty in turn to quit

#-------------------------------------------------------------------------------
# QUICKLOOK PREVIEW VIA PEEK

# killall "qlmanage" # remove existing quicklook previews
# qlmanage -p "$CACHE"
