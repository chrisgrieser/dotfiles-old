bindkey "\e\e" quitSession # Double Esc
bindkey "^P" copyLocation
bindkey "^B" copyBuffer

bindkey "^Z" undo
bindkey "^U" kill-buffer
bindkey "^K" kill-line
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


# https://github.com/zsh-users/zsh-autosuggestions/issues/532#issuecomment-907361899
# https://github.com/zsh-users/zsh-autosuggestions#key-bindings
bindkey '^I' autosuggest-execute # tab: auto-completion & execution from zsh-autosuggest
bindkey '^[[Z' autosuggest-accept # shift+tab: only auto-completion
# bindkey '^[[Z' complete-word   # shift+tab: completion suggestion
