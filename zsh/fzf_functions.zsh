# shellcheck disable=SC2164,SC1009,SC1073,SC1056

# Quick Open File
function o (){
	local INPUT="$*"
	[[ -e "$INPUT" ]] && { open "$INPUT" ; return }

	local SELECTED
	SELECTED=$(fd --hidden | fzf \
	           -0 -1 \
	           --query "$INPUT" \
	           --preview "bat --color=always --style=snip --wrap=character --tabs=3 --line-range=:100 --terminal-width=50 {}" \
	           )
	[[ -z "$SELECTED" ]] && return 130

	open "$SELECTED"
}

# cd to directory
function c (){
	local C_TO_SEARCH=~'/Library/Mobile Documents/com~apple~CloudDocs/'
	local INPUT="$*"
	[[ -d "$INPUT" ]] && { cd "$INPUT" ; return }

	cd "$C_TO_SEARCH" || return
	local SELECTED
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
	exa
}

