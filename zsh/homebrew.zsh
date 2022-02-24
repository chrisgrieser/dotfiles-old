# Configs https://docs.brew.sh/Manpage#environment
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=90
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_INSTALL_BADGE=✅

export BREWDUMP_PATH=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Homebrew & NPM Installs/"

alias re='brew reinstall'

function bu () {
	brew list "$1" &> /dev/null
	if [[ $? == 0 ]]; then
		brew uninstall --zap "$SELECTED"
	else
		# shellcheck disable=SC1009,SC1056,SC1072,SC1073
		local SELECTED=$( { brew list --casks ; brew leaves --installed-on-request } | fzf \
		           -0 -1 \
		           --query "$*" \
		           --preview 'HOMEBREW_COLOR=true brew info {}' \
		           --bind 'alt-enter:execute(brew home {})+abort' \
		           --preview-window=right:65% \
		           )
		[[ "$SELECTED" != "" ]] && brew uninstall --zap "$SELECTED"
	fi
}

function bi (){
	local TO_INSTALL="$1"
	local TYPE="$2" # formula or cask

	# abort if already installed
	brew list "$TO_INSTALL" && echo "Already installed." && return 0

	# if package does not exist, search for it via fzf
	brew info "$TO_INSTALL" &> /dev/null
	if [[ $? == 1 ]] ; then
		local SELECTED=""
		SELECTED=$( { brew formulae ; brew casks } | fzf \
		           --query "$TO_INSTALL" \
		           --preview 'HOMEBREW_COLOR=true brew info {}' \
		           --bind 'alt-enter:execute(brew home {})+abort' \
		           --preview-window=right:70% \
		           ) ;

		# abot if no selection made
		[[ $SELECTED == "" ]] && return 130

		TO_INSTALL="$SELECTED"
	fi

	# quotes would add empty 2nd arg if empty
	# get attention when there is a caveat, `\033[1;33m` = bold yellow
	HOMEBREW_COLOR=true brew install --no-quarantine "$TO_INSTALL" $TYPE \
	| sed -e 's/\[1mCaveats/\[1;33m⚠️⚠️ Caveats ⚠️⚠️/'

	# guard clause: if not cask, stop
	brew info "$TO_INSTALL" --cask &> /dev/null || return 0

	# shellcheck disable=SC2012
	local NEWEST_APP="$(ls -tc /Applications | head -n1)"
	echo "Open \"$NEWEST_APP\"? (y/n)" # offer to open

	# stop when decision not yes
	read -r -k 1 DECISION
	[[ "$DECISION:l" == "y" ]] || return 0 # ":l" = lowercase https://scriptingosx.com/2019/12/upper-or-lower-casing-strings-in-bash-and-zsh/

	open -a "$NEWEST_APP"
}

function print-section () {
	echo ""
	echo "$*"
	echo "---------------"
}

function dump () {
	DEVICE_NAME=$(scutil --get ComputerName)
	brew bundle dump --force --file "$BREWDUMP_PATH"/Brewfile_"$DEVICE_NAME"
	npm list -g --parseable | sed "1d" | sed -E "s/.*\///" > "$BREWDUMP_PATH"/NPMfile_"$DEVICE_NAME"
	pip3 freeze | cut -d"=" -f1 > "$BREWDUMP_PATH"/Pip3File_"$DEVICE_NAME"
	echo "Brewfile, NPM-File, and Pip3File dumped at \"$BREWDUMP_PATH\""
}

function update (){
	print-section "Homebrew"
	brew update
	brew upgrade
	brew cleanup
	brew autoremove # remove unneeded dependencies (brew leaves --installed-as-dependency)

	print-section "Mac App Store"
	mas upgrade

	print-section "NPM"
	npm update -g

	print-section "Pip3"
	pip3 install --upgrade pdfannots

	print-section "Dump Installs"
	dump

	osascript -e 'display notification "" with title "Updates finished."	'
}

function report (){
	print-section "Homebrew"
	echo "Taps"
	brew tap
	echo "Doctor"
	brew doctor
	echo "Leaves (installed on request)"
	brew leaves --installed-on-request
	echo "Leaves (installed as dependency)"
	brew leaves --installed-as-dependency
	echo "Casks"
	brew list --casks

	print-section "Mac App Store"
	mas list

	print-section "NPM"
	npm list -g

	print-section "Pip3"
	pip3 list

	print-section "Dump Installs"
	dump
}
