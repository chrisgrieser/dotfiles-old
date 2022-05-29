# https://www.thorsten-hans.com/5-types-of-zsh-aliases

# configurations
alias .star='open $STARSHIP_CONFIG'

# z & cd
alias zz='z -' # back
alias .="open ."
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias wd='z "$WD"' # working directory
alias za='zoxide add'
alias cd='z'

# utils
alias q='exit'
alias notify="osascript -e 'display notification \"\" with title \"Terminal Process finished.\" subtitle \"\" sound name \"\"'"
alias version='echo "macOS "`sw_vers -productVersion`'
alias resolution="osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 3,4"
alias urlencode='node --eval "console.log(encodeURIComponent(process.argv[1]))"'
alias t="alacritty-theme-switch"

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
alias exall='exa --all --long --git --icons --group-directories-first --sort=modified'
alias exa='exa --all --icons --group-directories-first --sort=modified --ignore-glob=.DS_Store'
alias exagit='git status --short; echo; exa --long --grid --git --git-ignore --no-user --no-permissions --no-time --no-filesize --ignore-glob=.git'
alias tree='exa --tree -L2'
alias treee='exa --tree -L3'
alias treeee='exa --tree -L4'
alias treeeee='exa --tree -L5'
alias size='exa --long --no-user --no-permissions --no-time' # size of files in current directory

# Global Alias
alias -g §='| grep --color -i'

# Suffix Aliases
# = default command to act upon the filetype, when is is entered
# without preceding command (analogous to `setopt AUTO_CD` but for files)
# shellcheck disable=SC2139
alias -s {css,ts,js,md,yml,json,plist,xml,pdf,png,jpg,jpeg}='open'
