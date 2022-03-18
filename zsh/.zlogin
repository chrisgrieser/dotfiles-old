# shellcheck disable=SC2164,SC1009,SC1073,SC1056

# requires these settings to work, since using built-in zsh
# stack directory (`man zshoptions` for explanations)
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# cd to recent directory
function r (){
	local INPUT="$*"
	[[ -d "$INPUT" ]] && { cd "$INPUT" ; return }
	local STACK
	STACK=$(dirs -p | sed 's/~\/Library\/Mobile Documents\/com~apple~CloudDocs/ /'\
	        | sed 's/~\/Library\/Mobile Documents\/iCloud~md~obsidian\/Documents/ /')
	local SELECTED
	SELECTED=$(echo "$STACK" | fzf \
	           -0 \
	           --query "$INPUT" \
	           --no-sort \
	           --height=60% \
	           --layout=reverse \
	           --info=inline
	           )
	[[ -z "$SELECTED" ]] && return 130

	local RESOLVED
	RESOLVED=$(echo "$SELECTED" \
	           | sed 's/ /~\/Library\/Mobile Documents\/com~apple~CloudDocs/'\
	           | sed 's/ /~\/Library\/Mobile Documents\/iCloud~md~obsidian\/Documents/')
	RESOLVED="${RESOLVED/#\~/$HOME}"
	cd "$RESOLVED" || return
	exa
}


# -------------------------------
# push common directories to directory stack
# has to be done in .zlogin, the directory stack gets reset on login
local temp="$PWD"
pushd -q ~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/"
pushd -q ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/"
pushd -q "$WD"

# Terminus will open the current file's path before .zlogin
if [[ "$TERM_PROGRAM" == "Terminus-Sublime" ]] ; then
	pushd -q "$temp"
fi


# -------------------------------
# fortune / color art

if [[ "$TERM_PROGRAM" != "Terminus-Sublime" ]] ; then
	clear
	# 33% art, 66% fortune
	if [[ $((RANDOM%3)) == 1 ]] ; then
		bash "$ZSH_DOTFILE_LOCATION"/plugins/colorscript.bash --random
	else
		echo
		echo "> $(fortune -n270 -s)"
	fi
	echo
fi

