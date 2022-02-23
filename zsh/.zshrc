# shellcheck disable=SC1091,SC1090,SC2292

# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

export ZSH_DOTFILE_LOCATION=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/zsh"


source "$ZSH_DOTFILE_LOCATION"/load_plugins.zsh # should be loaded first
source "$ZSH_DOTFILE_LOCATION"/aliases.zsh
source "$ZSH_DOTFILE_LOCATION"/history_config.zsh
source "$ZSH_DOTFILE_LOCATION"/docs_man.zsh
source "$ZSH_DOTFILE_LOCATION"/terminal_utils.zsh
source "$ZSH_DOTFILE_LOCATION"/fzf_functions.zsh
source "$ZSH_DOTFILE_LOCATION"/git_github.zsh
source "$ZSH_DOTFILE_LOCATION"/homebrew.zsh
source "$ZSH_DOTFILE_LOCATION"/npm.zsh
source "$ZSH_DOTFILE_LOCATION"/keybindings.zsh
source "$ZSH_DOTFILE_LOCATION"/general_configs.zsh

# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
