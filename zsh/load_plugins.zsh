# shellcheck disable=SC1090,SC1091,SC2292

# activate completions, also needed for ZSH auto suggestions & completions
autoload compinit -Uz +X && compinit

# NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
source "$ZSH_DOTFILE_LOCATION"/plugins/fzf-tab/fzf-tab.plugin.zsh

# `brew --prefix` ensures the right path is inserted on M1 and non-M1 macs
source "$(brew --prefix)"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$(brew --prefix)"/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(fasd --init auto)"
eval "$(starship init zsh)"
source "$ZSH_DOTFILE_LOCATION"/plugins/magic_enter.zsh
source "$ZSH_DOTFILE_LOCATION"/plugins/obsidian-vault-navigation.sh

# -------------------------------------------------
# fix for Starship-Terminus issue
# https://github.com/starship/starship/issues/3627
# https://github.com/randy3k/Terminus/issues/344

if [[ "$TERM_PROGRAM" == "Terminus-Sublime" ]] ; then
	export STARSHIP_CONFIG=~/.config/starship_terminus.toml
fi
