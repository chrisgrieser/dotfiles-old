# push common directories to directory stack
# has to be done in .zlogin, the directory stack gets reset on login
pushd -q ~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/" || true
pushd -q ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/" || true

# ---------------

# Terminus will open the current file's path
if [[ "$TERM_PROGRAM" != "Terminus-Sublime" ]] ; then
	cd "$WD" || return
fi

# requires these settings to work, since using built-in zsh
# stack directory (`man zshoptions` for explanations)
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# cd to recent directory
function r (){
	local STACK =
	local INPUT="$*"
	if [[ -d "$INPUT" ]]; then
		cd "$INPUT" || return
	else
		local SELECTED=$(dirs -p | fzf \
		           -0 \
		           --query "$INPUT" \
		           --no-sort \
		           --height=60% \
		           --layout=reverse \
		           --info=inline
		           )
		[[ -z "$SELECTED" ]] && return 130

		local RESOLVED_PATH="${SELECTED/#\~/$HOME}"
		cd "$RESOLVED_PATH" || return
	fi
	exa
}
