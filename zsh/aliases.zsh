# https://www.thorsten-hans.com/5-types-of-zsh-aliases

# configurations
alias .star='open ~/.config/starship.toml'
alias .zsh='open ~/.zshrc'
alias .hyper='open ~/.hyper.js'

# https://stackoverflow.com/q/2518127
# alias rr='source ~/.zshrc && echo ".zshrc reloaded"'
alias rr='exec zsh'

# shortcuts
alias q='exit'
alias size='exa --long --no-user --no-permissions --no-time' # size of files in current directory
alias b='cd - &> /dev/null' # back
alias .="open ."
alias wd='cd "$WD"' # working directory

# utils
alias notify="osascript -e 'display notification \"\" with title \"Terminal Process finished.\" subtitle \"\" sound name \"\"'"
alias version='echo "macOS "`sw_vers -productVersion`'
alias resolution="osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 3,4"
alias urlencode='node --eval "console.log(encodeURIComponent(process.argv[1]))"'

# colorize by default
alias grep='grep --color -i' # and case insensitive
alias ls='ls -G'
alias exa='exa --all --icons --group-directories-first --sort=modified'
alias exagit='exa --long --git --git-ignore --no-user --no-permissions --no-filesize --no-time --grid'
alias exatree='exa --tree -L2'
alias diff='diff --color=auto'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mv='ln -i'

# display all
alias which='which -a'

# Global Alias
alias -g §='| grep --color -i'

# Suffix Aliases
alias -s pdf='open -a "PDF Expert"'
# shellcheck disable=SC2139
alias -s {css,ts,js,applescript,md,yml,json,plist,xml}=subl
# shellcheck disable=SC2139
alias -s {png,jpg,jpeg}='open -a "Preview"'
