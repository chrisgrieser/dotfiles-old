bindkey "\e\e" quitSession # Double Esc
bindkey "^L" openCurrentLocation
bindkey "^P" copyLocation
bindkey "^B" copybuffer
bindkey "^I" open-zshrc # triggered via Alfred als cmd+,

# `bindkey -M main` to show existing keybinds
bindkey "^Z" undo
bindkey "^U" kill-buffer
bindkey "^V" yank # pastes content previously removed with 'kill-buffer'

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
	SELECTED=$( { ls -t "$ZSH_DOTFILE_LOCATION"  | cut -d"." -f1; echo ".zshrc"; } | fzf \
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
		open "$ZSH_DOTFILE_LOCATION"/"$SELECTED".zsh
	fi
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
