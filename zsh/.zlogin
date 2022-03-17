# shellcheck disable=SC2164

# requires these settings to work, since using built-in zsh
# stack directory (`man zshoptions` for explanations)
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# cd to recent directory
function r (){
	local INPUT="$*"
	if [[ -d "$INPUT" ]]; then
		cd "$INPUT" || return
	else
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
	fi
	exa
}


# -------------------------------
# push common directories to directory stack
# has to be done in .zlogin, the directory stack gets reset on login
pushd -q ~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/"
pushd -q ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/"

# Terminus will open the current file's path
if [[ "$TERM_PROGRAM" != "Terminus-Sublime" ]] ; then
	pushd -q "$WD"
fi
