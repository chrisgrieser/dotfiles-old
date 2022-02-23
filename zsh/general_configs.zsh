# Working Directory
export WD=~"/Library/Mobile Documents/com~apple~CloudDocs/File Hub"

# go the working directory
# except with Terminus, which will open the current file's path
if [[ "$TERM_PROGRAM" != "Terminus-Sublime" ]] ; then
	cd "$WD" || return
fi

# ----------------------------------

# Configs for my own custom functions
export BREWDUMP_PATH=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Homebrew & NPM Installs/"
export VAULT_PATH=~'/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault'
export C_TO_SEARCH=~'/Library/Mobile Documents/com~apple~CloudDocs/'

# ----------------------------------

# ENVIRONMENT --- (use `printenv` to see all environment variables)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)" # ignores long history items
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

export YSU_MESSAGE_POSITION="after"
export YSU_MODE=ALL
export YSU_HARDCORE=1
export YSU_IGNORED_ALIASES=("tree" "ls")

# for fzf-tab
# shellcheck disable=SC2086,SC2296
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export BAT_THEME='Sublime Snazzy'

export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='-0 -1 --pointer=⟐ --prompt="❱ "'

export MAGIC_ENTER_GIT_COMMAND="git status"
export MAGIC_ENTER_OTHER_COMMAND="tree -C -L 2"

export EDITOR='nano' # mainly for `crontab -e`

# ----------------------------------

# OPTIONS --- (`man zshoptions` to see all options)
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# case insensitive path-completion https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

