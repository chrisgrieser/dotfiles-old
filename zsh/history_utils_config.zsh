# https://www.soberkoder.com/better-zsh-history/

export HISTSIZE=3000
export SAVEHIST=3000
export HISTFILE="$ZSH_DOTFILE_LOCATION"/.zsh_history
export HIST_DATE_FORMAT='%A, %d.%m.%Y  %H:%M' # custom, defined by me

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

# --------------------------

# SEARCH HISTORY FOR A COMMAND
# enter ➞ write to buffer
# alt+enter ➞ copy to clipboard
DATE_CHAR_COUNT=$(echo "$HIST_DATE_FORMAT" | wc -m | tr -d " ")
CUT_1=$((DATE_CHAR_COUNT + 15))
CUT_2=$((DATE_CHAR_COUNT + 12))
function hs {
	SELECTED=$(history -t "$HIST_DATE_FORMAT" 1 | cut -c"$CUT_1"- | fzf \
	           --tac --no-sort \
	           --layout=reverse \
	           --info=hidden \
	           --query "$*" \
	           --height=50% \
	           --bind 'alt-enter:execute(echo {} | pbcopy)+abort' \
	           --preview "grep {} \"$HISTFILE\" | cut -c3-13" \
	           --preview-window=right:40% \
	          )
	print -z "$SELECTED"
}
