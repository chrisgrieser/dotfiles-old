# Must be at the start of the file
# shellcheck disable=SC1090,SC1091,SC2292
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

# activate completions, also needed for ZSH auto suggestions & completions
autoload compinit -Uz && compinit


# `brew --prefix` ensures the right path is inserted on M1 and non-M1 macs
source "$(brew --prefix)"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$(brew --prefix)"/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$(brew --prefix)"/share/zsh-you-should-use/you-should-use.plugin.zsh

eval "$(fasd --init auto)"
eval "$(thefuck --alias)"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/.starship.toml"

# -------------------------------------
# Shellfirm
shellfirm --version >/dev/null 2>&1
# shellcheck disable=SC2181
if [ "$?" != 0 ]; then
    # show this message to the user and don't register to terminal hook
    # we want to show the user that he not protected with `shellfirm`
    echo "'shellfirm' binary is missing. see installation guide: https://github.com/kaplanelad/shellfirm#installation."
    return
fi

function shellfirm-pre-command () {
    if [[ "${1}" == *"shellfirm pre-command"* ]]; then
        return
    fi
    shellfirm pre-command --command "${1}"
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec shellfirm-pre-command
# -------------------------------------
