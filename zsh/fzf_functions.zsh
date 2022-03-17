# Quick Open File
function o (){
	INPUT="$*"
	if [[ -e "$INPUT" ]]; then
		open "$INPUT"
	else
		SELECTED=$(fd --hidden | fzf \
		           -0 -1 \
		           --query "$INPUT" \
		           --preview "bat --color=always --style=snip --wrap=character --tabs=3 --line-range=:100 --terminal-width=50 {}" \
		           )
		[[ -z "$SELECTED" ]] && return 130

		open "$SELECTED"
	fi
}

# cd to directory
function c (){
	C_TO_SEARCH=~'/Library/Mobile Documents/com~apple~CloudDocs/'
	INPUT="$*"
	if [[ -d "$INPUT" ]]; then
		cd "$INPUT" || return
	else
		cd "$C_TO_SEARCH" || return
		SELECTED=$(fd --type d --exclude "*.app" | cut -c3- | fzf \
		           -0 -1 \
		           --query "$INPUT" \
		           --preview "exa -T -L2 {}" \
		           --preview-window=right:35% \
		           --height=80% \
		           --layout=reverse \
		           --info=inline
		           )
		[[ -z "$SELECTED" ]] && return 130

		cd "$C_TO_SEARCH""$SELECTED" || return
	fi
	exa
}

