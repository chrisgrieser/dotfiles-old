function ch () {
	QUERY=$(echo "$*" | tr " " "+")
	curl -s "https://cht.sh/$QUERY" | "$PAGER"
}

export HOWDOI_COLORIZE=1
function h () {
	howdoi "$*" -c -n 4 | "$PAGER"
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
export MOAR="--no-linenumbers --render-unprintable=whitespace"

[38;5;246;03m# fd[39;00m
[38;5;246;03m# An alternative to `find`.[39;00m
[38;5;246;03m# Aims to be faster and easier to use than `find`.[39;00m
[38;5;246;03m# More information: <https://github.com/sharkdp/fd>.[39;00m

[38;5;246;03m# Recursively find files matching the given pattern in the current directory:[39;00m
[38;5;252mfd[39m[38;5;252m [39m[38;5;252mpattern[39m

[38;5;246;03m# Find files that begin with "foo":[39;00m
[38;5;252mfd[39m[38;5;252m [39m[38;5;214m'^foo'[39m

[38;5;246;03m# Find files with a specific extension:[39;00m
[38;5;252mfd[39m[38;5;252m [39m[38;5;252m--extension[39m[38;5;252m [39m[38;5;252mtxt[39m

[38;5;246;03m# Find files in a specific directory:[39;00m
[38;5;252mfd[39m[38;5;252m [39m[38;5;252mpattern[39m[38;5;252m [39m[38;5;252mpath/to/directory[39m

[38;5;246;03m# Include ignored and hidden files in the search:[39;00m
[38;5;252mfd[39m[38;5;252m [39m[38;5;252m--hidden[39m[38;5;252m [39m[38;5;252m--no-ignore[39m[38;5;252m [39m[38;5;252mpattern[39m

[38;5;246;03m# Execute a command on each search result returned:[39;00m
[38;5;252mfd[39m[38;5;252m [39m[38;5;252mpattern[39m[38;5;252m [39m[38;5;252m--exec[39m[38;5;252m [39m[38;5;31mcommand[39m
