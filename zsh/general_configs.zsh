# shellcheck disable=SC2190

# ENVIRONMENT --- (use `printenv` to see all environment variables)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)" # ignores long history items
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh syntax highlighting,
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_PATTERNS # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/pattern.md
ZSH_HIGHLIGHT_PATTERNS+=('rm -*f*' 'fg=white,bold,bg=red') # `rm -f` in red
ZSH_HIGHLIGHT_PATTERNS+=('git reset' 'fg=white,bold,bg=red') # `git reset` in red
ZSH_HIGHLIGHT_PATTERNS+=('§' 'fg=magenta,bold') # § = global alias for grepping

# for fzf-tab
zstyle ':completion:*:descriptions' format '[%d]'
# shellcheck disable=SC2016
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

export BAT_THEME='Sublime Snazzy'

export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='-0 --pointer=⟐ --prompt="❱ "'

export MAGIC_ENTER_GIT_COMMAND="exagit"
export MAGIC_ENTER_OTHER_COMMAND="exa"

export EDITOR='nano' # mainly for `crontab -e` and `git commit --amend`

# ----------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# in hundredth's of seconds (default: 0.4 seconds)
export KEYTIMEOUT=1

# OPTIONS --- (`man zshoptions` to see all options)
setopt AUTO_CD

setopt INTERACTIVE_COMMENTS # comments in interactive mode (useful für copypasting)
# setopt NOTIFY # report the status of backgrounds jobs immediately

# case insensitive path-completion, see https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

