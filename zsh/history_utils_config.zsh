# https://www.soberkoder.com/better-zsh-history/

export HISTSIZE=3000
export SAVEHIST=3000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_VERIFY

# search history for a command
# enter ➞ write to buffer
# alt+enter ➞ copy to clipboard
function hs {
	SELECTED=$(history 1 | cut -c8- | uniq | fzf \
	           --tac --no-sort \
	           --layout=reverse \
	           --info=hidden \
	           --query "$*" \
	           --height=50% \
	           --bind 'alt-enter:execute(echo {} | pbcopy)+abort' \
	          )
	print -z "$SELECTED"
}
