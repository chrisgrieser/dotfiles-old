bindkey "\e\e" quitSession # Double Esc
bindkey "^P" copyLocation
bindkey "^B" copyBuffer

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
zle -N copyBuffer

# '^ [[Z' = Shift-Tab
# https://github.com/zsh-users/zsh-autosuggestions#key-bindings
bindkey '^ [[Z' autosuggest-accept
