# Move to trash
function del () {
	FILE_NAME=$(basename "$1")
	EXT="${FILE_NAME##*.}"
	FILE_WITHOUT_EXTENSION="${FILE_NAME%.*}"
	APPEND=$(date '+%m-%d_%H-%M-%S')
	mv "$FILE_NAME" ~/.Trash/"$FILE_WITHOUT_EXTENSION""$APPEND"."$EXT"
}

# exit
function qq () {
	if [[ "$TERM_PROGRAM" == "Terminus-Sublime" ]] ; then
		TO_QUIT="Sublime Text"
	else
		TO_QUIT="$TERM_PROGRAM"
	fi
	osascript -e "tell application \"$TO_QUIT\" to quit"
}

# Terminal Switch
function sw () {
	if [[ "$TERM_PROGRAM" == "Terminus-Sublime" ]] ; then
		# shellcheck disable=SC2154
		open -a "Hyper" "$cwd"
		exit
	elif [[ "$TERM_PROGRAM" == "Hyper" ]] ; then
		open -a "Sublime Text"
		sleep 0.1
		subl --command "toggle_terminus_panel { \"cwd\": \"\${file_path:\${folder}}\"  }"
	fi
}

# get path of file
function p () {
	PATH_TO_COPY="$(pwd)/$*"
	echo "$PATH_TO_COPY" | pbcopy
	echo "Copied: ""$PATH_TO_COPY"
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

# peek into zip file
function peek () {
	unzip -l "$*" | tail -n+4 | cut -c31-
}
