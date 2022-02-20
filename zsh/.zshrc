# shellcheck disable=SC1091,SC1090,SC2292

export ZSH_DOTFILE_LOCATION=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/zsh"

# must be loaded first
source "$ZSH_DOTFILE_LOCATION"/load_before.zsh

source "$ZSH_DOTFILE_LOCATION"/aliases.zsh
source "$ZSH_DOTFILE_LOCATION"/history_utils_config.zsh
source "$ZSH_DOTFILE_LOCATION"/docs_man.zsh
source "$ZSH_DOTFILE_LOCATION"/terminal_utils.zsh
source "$ZSH_DOTFILE_LOCATION"/fzf_functions.zsh
source "$ZSH_DOTFILE_LOCATION"/git_github.zsh
source "$ZSH_DOTFILE_LOCATION"/homebrew_npm.zsh
source "$ZSH_DOTFILE_LOCATION"/magic_enter.zsh
source "$ZSH_DOTFILE_LOCATION"/keybindings.zsh
source "$ZSH_DOTFILE_LOCATION"/general_configs.zsh

# must be loaded last
source "$ZSH_DOTFILE_LOCATION"/load_after.zsh
