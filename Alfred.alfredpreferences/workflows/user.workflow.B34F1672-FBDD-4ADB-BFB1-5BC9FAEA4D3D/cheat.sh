#!/usr/bin/env zsh
export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH

QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT_INFO=$(curl -s "https://cht.sh/$QUERY?T") # https://cht.sh/:help
CHEAT_CODE_ONLY=$(curl -s "https://cht.sh/$QUERY?TQ")

# remove signature
CHEAT_INFO=$(echo "$CHEAT_INFO" | sed '/\] \[cc/d')

# copy to clipboard
echo "$CHEAT_CODE_ONLY" | pbcopy

LANG="sh"
if [[ "$QUERY" =~ "/" ]] ; then
	LANG=$(echo "$QUERY" | cut -d"/" -f1)
	QUERY=$(echo "$QUERY" | cut -d"/" -f2- | tr "+" " ")
fi

CACHE=~"/Library/Caches/$QUERY.$LANG"
echo "${LANG:u} -- $QUERY" > "$CACHE" # header bar
echo "" >> "$CACHE"
echo "$CHEAT_INFO" >> "$CACHE"

#-------------------------------------------------------------------------------
# PREVIEW VIA BAT
PREVIEW_CONFIG=~/.config/alacritty/preview-window.yml
BG_COLOR=#303643
STATUSLINE_COLOR=#5E6F8A
BAT_SYNTAX_THEME="Nord" # `bat --list-themes` for more themes

alacritty \
	--config-file="$PREVIEW_CONFIG" \
	--option="colors.primary.background='$BG_COLOR'" \
	--option="colors.primary.foreground='$STATUSLINE_COLOR'" \
	--title="Cheat Sheet"\
	--command bat "$CACHE" \
		--file-name="$LANG – $QUERY" \
		--language="$LANG" \
		--theme="$BAT_SYNTAX_THEME" \
		--decorations=never \
		--highlight-line=1 \
		--pager="less -R --long-prompt +Gg --window=-6 --incsearch --tilde"
# the pager options needs to be set explicitly, as without
# bat sets "quit-if-one-screen" as a less option, closing most cheatsheets
# causing in turn alacritty to quit before showing anything

#-------------------------------------------------------------------------------
# quicklook preview via peek
# killall "qlmanage" # remove existing quicklook previews
# qlmanage -p "$CACHE"
