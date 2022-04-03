function ch () {
	curl "https://cht.sh/""$*"
}

export HOWDOI_COLORIZE=1
function h () {
	howdoi "$*" -c -n 3
}

if [[ TERMINAL ]]; then
	#statements
fi
function man () {
	alacritty --option=window.dimensions.columns=70 --option=window.decorations=full --title="man $1" --command man "$1" &
}

# man pages for zsh-builtins https://stackoverflow.com/a/35456287
unalias run-help 2>/dev/null
autoload run-help
alias help='run-help'
export HELPDIR=/usr/share/zsh/5.8/help

# use moar instead of less (moar also uses color options forn LESS below)
export PAGER=moar
export MOAR="--no-linenumbers --render-unprintable=whitespace"

# colorize less https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;33m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_us=$'\E[1;34m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESS='--status-column --tabs=3 --window=-5 --quit-at-eof'

# protect special characters
export LC_CTYPE="en_US.UTF-8"
