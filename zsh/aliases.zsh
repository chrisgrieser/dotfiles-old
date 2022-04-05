# https://www.thorsten-hans.com/5-types-of-zsh-aliases

# configurations
alias .star='open $STARSHIP_CONFIG'
alias .zsh='open ~/.zshrc'

alias rr='source ~/.zshrc'
# https://stackoverflow.com/q/2518127
# alias rr='exec zsh'

# shortcuts
alias q='exit'
alias b='cd - &> /dev/null' # back
alias .="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias wd='cd "$WD"' # working directory

# utils
alias notify="osascript -e 'display notification \"\" with title \"Terminal Process finished.\" subtitle \"\" sound name \"\"'"
alias version='echo "macOS "`sw_vers -productVersion`'
alias resolution="osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 3,4"
alias urlencode='node --eval "console.log(encodeURIComponent(process.argv[1]))"'

# colorize by default
alias grep='grep --color -i' # and case insensitive
alias ls='ls -G'
alias diff='diff --color=auto'

# Safety nets
alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias cp='cp -i'

# defaults
alias which='which -a'
alias mkdir='mkdir -p'
alias pip="pip3"

# exa
alias exa='exa --all --icons --group-directories-first --sort=modified'
alias exagit='git status --short ; exa --long --grid --git --git-ignore --no-user --no-permissions --no-time --no-filesize --ignore-glob=.git'
alias tree='exa --tree -L2'
alias tree3='exa --tree -L3'
alias tree4='exa --tree -L4'
alias size='exa --long --no-user --no-permissions --no-time' # size of files in current directory

# Global Alias
alias -g §='| grep --color -i'

# Suffix Aliases
# shellcheck disable=SC2139
alias -s {css,ts,js,applescript,md,yml,json,plist,xml,pdf,png,jpg,jpeg}='open'
