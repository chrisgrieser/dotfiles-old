# shellcheck disable=SC1090,SC1091,SC2292

# activate completions, also needed for ZSH auto suggestions & completions
autoload compinit -Uz && compinit

# NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
source "$ZSH_DOTFILE_LOCATION"/plugins/fzf-tab/fzf-tab.plugin.zsh

# `brew --prefix` ensures the right path is inserted on M1 and non-M1 macs
source "$(brew --prefix)"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$(brew --prefix)"/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$(brew --prefix)"/share/zsh-you-should-use/you-should-use.plugin.zsh

eval "$(fasd --init auto)"
eval "$(thefuck --alias)"

eval "$(starship init zsh)"
source "$ZSH_DOTFILE_LOCATION"/plugins/magic_enter.zsh
source "$ZSH_DOTFILE_LOCATION"/plugins/obsidian-vault-navigation.sh

# Shellfirm, https://github.com/kaplanelad/shellfirm/blob/main/shell-plugins/shellfirm.plugin.zsh
function shellfirm-pre-command () {
    if [[ "${1}" == *"shellfirm pre-command"* ]]; then
        return
    fi
    shellfirm pre-command --command "${1}"
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec shellfirm-pre-command
