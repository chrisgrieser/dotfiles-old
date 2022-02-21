function ch () {
	curl "https://cht.sh/""$*"
}

export HOWDOI_COLORIZE=1
function h () {
	howdoi "$*" -c -n 3
}

# man pages for zsh-builtins https://stackoverflow.com/a/35456287
unalias run-help 2>/dev/null
autoload run-help
alias help='run-help'
export HELPDIR=/usr/share/zsh/5.8/help

# use moar instead of less
export PAGER="$(brew --prefix)"/bin/moar
export MOAR="--style=dracula --no-linenumbers"

# colorize less https://wiki.archlinux.org/index.php/Color_output_in_console#less .
# export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;33m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
# export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
# export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# export LESS='--status-column --tabs=3 --window=-4 --quit-at-eof'
