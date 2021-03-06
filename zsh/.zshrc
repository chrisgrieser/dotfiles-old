# shellcheck disable=SC1094
export ZSH_DOTFILE_LOCATION=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/zsh"

source "$ZSH_DOTFILE_LOCATION"/load_plugins.zsh # should be loaded first
source "$ZSH_DOTFILE_LOCATION"/global_variables.zsh # should be close to top
source "$ZSH_DOTFILE_LOCATION"/aliases.zsh
source "$ZSH_DOTFILE_LOCATION"/history_config.zsh
source "$ZSH_DOTFILE_LOCATION"/docs_man.zsh
source "$ZSH_DOTFILE_LOCATION"/terminal_utils.zsh
source "$ZSH_DOTFILE_LOCATION"/fzf_functions.zsh
source "$ZSH_DOTFILE_LOCATION"/git_github.zsh
source "$ZSH_DOTFILE_LOCATION"/homebrew.zsh
source "$ZSH_DOTFILE_LOCATION"/npm.zsh
source "$ZSH_DOTFILE_LOCATION"/keybindings.zsh
source "$ZSH_DOTFILE_LOCATION"/general_and_plugin_configs.zsh
source "$ZSH_DOTFILE_LOCATION"/../pandoc/pandoc.zsh
