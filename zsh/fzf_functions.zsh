# Quick Open File
function o (){
	INPUT="$*"
	if [[ -e "$INPUT" ]]; then
		open "$INPUT"
	else
		SELECTED=$(fd --hidden | fzf -0 -1 --query "$INPUT" --preview "bat --color=always --style=snip --wrap=character --tabs=3 --line-range=:100 --terminal-width=50 {}")
		if [[ $SELECTED == "" ]] ; then
			echo "Canceled."
			return
		fi
		open "$SELECTED"
	fi
}

# change directory
function c (){
	C_TO_SEARCH=~'/Library/Mobile Documents/com~apple~CloudDocs/'
	INPUT="$*"
	if [[ -e "$INPUT" ]]; then
		cd "$INPUT" || return
	else
		cd "$C_TO_SEARCH" || return
		SELECTED=$(fd --type d | cut -c3- | fzf -0 -1 --query "$*" --preview "tree -L 2 -C {}" --preview-window=right:35%)
		if [[ $SELECTED == "" ]] ; then
			echo "Canceled."
			return
		fi
		cd "$C_TO_SEARCH""$SELECTED" || return
	fi
	exa
}

# open recent directory
function r (){
	SELECTED=$(fasd -td | cut -c12- | \
	           sed "s/\/Users\/.[^/]*/~/" | \
	           sed "s/Library\/Mobile Documents\/com~apple~CloudDocs/iCloud/" | \
	           sed "s/Library\/Mobile Documents\/iCloud~md~obsidian\/Documents/Obsidian-Vaults/" | \
	           fzf --query "$*" \
	          )
	if [[ $SELECTED == "" ]] ; then
		echo "Canceled."
		return
	fi
	SELECTED="${SELECTED/#\~/$HOME}"
	SELECTED="${SELECTED/iCloud/Library/Mobile Documents/com~apple~CloudDocs}"
	SELECTED="${SELECTED/Obsidian-Vaults/Library/Mobile Documents/iCloud~md~obsidian/Documents}"
	cd "$SELECTED" || return
	exa
}
