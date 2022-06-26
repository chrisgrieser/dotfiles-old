function cc () {
	QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
	CHEAT=$(curl -s "https://cht.sh/$QUERY") # https://cht.sh/:help
	echo "$CHEAT" | pbcopy
	echo "$CHEAT" | "$PAGER"
}

# if alacritty installed open man page in new alacritty window
if which alacritty &> /dev/null ; then
	function man () {
		# abort if pager or command uninstalled
		which "$1" &> /dev/null
		if [[ $? == 1 ]] ; then
			echo "Command '$1' not installed."
			return 1
		fi
		which "$PAGER" &> /dev/null
		if [[ $? == 1 ]] ; then
	 		echo "Pager '$PAGER' not installed."
	 		return 1
	 	fi

		# run in subshell to surpress output
		(alacritty \
			--option=window.decorations=full \
			--title="man $1" \
			--command man "$1" &)
	}
fi

# man pages for zsh-builtins https://stackoverflow.com/a/35456287
unalias run-help 2>/dev/null
autoload run-help
alias help='run-help'
zsh_ver=$(zsh --version | cut -d" " -f2)
export HELPDIR="/usr/share/zsh/$zsh_ver/help"

# use moar instead of less (moar also uses color options forn LESS below)
export PAGER=less

# colorize less https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;33m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_us=$'\E[1;34m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Pager-specific settings
export LESS='--window=-5 -R --quit-at-eof --incsearch --quit-if-one-screen --no-init'
# export MOAR="--no-linenumbers --render-unprintable=whitespace"

