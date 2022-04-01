# Move to trash via Finder (allows retrievability)
# no arg = all files in folder will be deleted
function del () {
	if [[ $# == 0 ]]; then
		IFS=$'\n'
		# shellcheck disable=SC2207
		ALL_FILES=($(find . -not -name ".*"))
		unset IFS
	else
		ALL_FILES=( "$@" ) # save as array
	fi
	for ARG in "${ALL_FILES[@]}"; do
		ABSOLUTE_PATH="$(cd "$(dirname "$ARG")" || return 1; pwd -P)/$(basename "$ARG")"
		osascript -e "
			set toDelete to \"$ABSOLUTE_PATH\" as POSIX file
			tell application \"Finder\" to delete toDelete
		" >/dev/null
	done
}

# Make directory and cd there
function mkcd () {
	mkdir -p "$1"
	cd "$1" || return
}

# Terminal Switch
function sw () {
	if [[ "$TERM_PROGRAM" == "Terminus-Sublime" ]] ; then
		open -a "Alacritty"
		cd "$WD" || exit
		exit
	else
		open -a "Sublime Text"
		sleep 0.1
		subl --command "toggle_terminus_panel { \"cwd\": \"\${file_path:\${folder}}\"  }"
	fi
}

# restart terminal
function rrr () {
	nohup "$ZSH_DOTFILE_LOCATION"/restart_terminal.zsh >/dev/null &
}

# get path of file
function p () {
	# shellcheck disable=SC2164
	ABSOLUTE_PATH="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"
	echo "$ABSOLUTE_PATH" | pbcopy
	echo "Copied: ""$ABSOLUTE_PATH"
}

# copies last n commands
function lc (){
	number="$*"
	if [[ "$number" == "" ]] ; then
		echo -n "$(history | tail -n 1 | cut -c 8-)" | pbcopy
	else
		history | tail -n "$number" | cut -c 8- | pbcopy
	fi
	echo "Copied."
}

# Save last n commands to Drafts
function lcd (){
	number="$*"
	if [[ "$number" == "" ]] ; then
		number=1
	fi
	lastCommand=$(history | tail -n "$number" | cut -c 8-)
	osascript -e "tell application \"Drafts\" to make new draft with properties {content: \"$lastCommand\", tags: {\"Terminal Command\"}}"
}

# copies result of last command
function lr (){
	last_command=$(history | tail -n 1 | cut -c 8-)
	echo -n "$(eval "$last_command")" | pbcopy
	echo "Copied."
}
