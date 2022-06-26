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

# the pager options needs to be set explicitly, as without
# bat sets "quit-if-one-screen" as a less option, closing most cheatsheets
# causing alacritty in turn to quit
# alacritty \
# 	--option=window.position.x=700 \
# 	--option=window.position.y=120 \
# 	--option=window.dimensions.columns=80 \
# 	--option=window.dimensions.lines=27 \
# 	--command bat "$CACHE" \
# 		--pager="less -R" \
# 		--file-name="$LANG – $QUERY" \
# 		--language="$LANG" \
# 		--style=numbers,header

#-------------------------------------------------------------------------------
# quicklook preview via Peek
killall "qlmanage" # remove existing quicklook previews
qlmanage -p "$CACHE"
