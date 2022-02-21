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
	cd "$C_TO_SEARCH" || return
	SELECTED=$(fd --type d | cut -c3- | fzf -0 -1 --query "$*" --preview "tree -L 2 -C {}" --preview-window=right:35%)
	if [[ $SELECTED == "" ]] ; then
		echo "Canceled."
		return
	fi
	cd "$C_TO_SEARCH""$SELECTED" || return
	ls -G
}

# open recent directory
function r (){
	SELECTED=$(fasd -td | cut -c12- | \
	           sed "s/\/Users\/.[^/]*/~/" | \
	           sed "s/Library\/Mobile Documents\/com~apple~CloudDocs/iCloud/" | \
	           fzf --query "$*" \
	               --preview "tree -L 2 -C {}" \
	               --preview-window=right:35% \
	          )
	if [[ $SELECTED != 0 ]] ; then
		echo "Canceled."
		return
	fi
	SELECTED="${SELECTED/#\~/$HOME}"
	SELECTED="${SELECTED/iCloud/Library/Mobile Documents/com~apple~CloudDocs}"
	cd "$SELECTED" || return
}
