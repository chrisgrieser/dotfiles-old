bindkey "\e\e" quitSession # Double Esc
bindkey "^L" openCurrentLocation
bindkey "^P" copyLocation
bindkey "^B" copybuffer
bindkey "^O" open-zshrc # triggered via Alfred als "cmd+,"
bindkey "^W" clear-screen #triggered via Sublime/Terminal as "cmd+k"

bindkey "^Z" undo
bindkey "^U" kill-buffer
bindkey "^V" yank # = pastes content previously removed with 'kill-buffer'

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
quitSession () {
	exit
}
openCurrentLocation () {
	open .
}
open-zshrc () {
	if [[ $# == 0 ]] ; then
		SEARCH_FOR="$*"
	else
		SEARCH_FOR="$BUFFER"
	fi
	# shellcheck disable=SC2012
	( cd "$ZSH_DOTFILE_LOCATION" || return
	# shellcheck disable=SC2035
	SELECTED=$( ls -t *.zsh | cut -d"." -f1 | fzf \
	           --no-sort \
	           -0 -1 \
	           --query "$SEARCH_FOR" \
	           --preview "bat --style=snip --tabs=2 --color=always --terminal-width=70 --line-range=:100 --wrap=never \"$ZSH_DOTFILE_LOCATION\"/{}.zsh" \
	           --preview-window=right:70% \
	           --height=50% \
	           --layout=reverse \
	           --info=hidden \
	           )
	if [[ $SELECTED != "" ]] ; then
		open "$SELECTED".zsh
	fi )
	zle reset-prompt # https://stackoverflow.com/questions/52325626/zsh-refresh-prompt-after-running-zle-widget
}

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/copybuffer/copybuffer.plugin.zsh
copybuffer () {
	printf "%s" "$BUFFER" | pbcopy
}

zle -N copyLocation
zle -N copybuffer
zle -N quitSession
zle -N openCurrentLocation
zle -N open-zshrc
