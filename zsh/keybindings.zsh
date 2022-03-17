bindkey "\e\e" quitSession # Double Esc
bindkey "^P" copyLocation
bindkey "^B" copyBuffer
bindkey "^O" open-zshrc # triggered via Alfred als "cmd+,"

bindkey "^Z" undo
bindkey "^U" kill-buffer
bindkey "^V" yank # pastes content previously removed with 'kill-buffer'

# [alt+arrow] - move word forward or backward
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# `bindkey -M main` to show existing keybinds
# there `^[` usually means escape
# some bindings with '^' are reserved (^M=enter, ^I=tab)
# -----------------------------------

copyLocation () {
	pwd | pbcopy
}
zle -N copyLocation

quitSession () {
	exit
}
zle -N quitSession

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/copybuffer/copybuffer.plugin.zsh
copyBuffer () {
	printf "%s" "$BUFFER" | pbcopy
}
zle -N copybuffer

open-zshrc () {
	if [[ $# == 0 ]] ; then
		SEARCH_FOR="$*"
	else
		SEARCH_FOR="$BUFFER"
	fi
	# shellcheck disable=SC2012
	( cd "$ZSH_DOTFILE_LOCATION" || return
	# shellcheck disable=SC1009,SC1056,SC1073,SC2035
	SELECTED=$( { ls *.zsh | cut -d. -f1 ; ls .z* } | fzf \
	           -0 -1 \
	           --query "$SEARCH_FOR" \
	           --preview "bat --style=snip --tabs=2 --color=always --terminal-width=70 --line-range=:100 --wrap=never \"$ZSH_DOTFILE_LOCATION\"/{}.zsh" \
	           --preview-window=right:70% \
	           --height=75% \
	           --layout=reverse \
	           --info=hidden \
	           )
	if [[ $SELECTED != "" ]] ; then
		[[ $SELECTED != .z* ]] && SELECTED="$SELECTED.zsh"
		open "$SELECTED"
	fi )
	zle reset-prompt # https://stackoverflow.com/questions/52325626/zsh-refresh-prompt-after-running-zle-widget
}
zle -N open-zshrc
