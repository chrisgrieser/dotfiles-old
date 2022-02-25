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
	if brew list "$1" ; then
		brew uninstall --zap "$INPUT"
		return
	fi

	local SELECTED=""
	# shellcheck disable=SC1009,SC1056,SC1072,SC1073
	local SELECTED=$( { brew list --casks ; brew leaves --installed-on-request } | fzf \
	           -0 \
	           --query "$1" \
	           --preview 'HOMEBREW_COLOR=true brew info {}' \
	           --bind 'alt-enter:execute(brew home {})+abort' \
	           --preview-window=right:65% \
	           )
	[[ "$SELECTED" == "" ]] && return 130
	brew uninstall --zap "$SELECTED"
}

function bi (){
	local TO_INSTALL="$1"
	local TYPE="$2" # formula or cask

	# abort if already installed
	brew list "$TO_INSTALL" 2> /dev/null && echo "Already installed." && return 0

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

		# abort if no selection made
		[[ $SELECTED == "" ]] && return 130

		local TO_INSTALL="$SELECTED"
		echo "installing \"TO_INSTALL\""
	fi

	brew install --no-quarantine "$TO_INSTALL" $TYPE # quotes would add empty 2nd arg if empty
	BREW_INFO=$(brew info "$TO_INSTALL")

	# emphasize caveats
	if [[ "$BREW_INFO" =~ "Caveats" ]] ; then
		echo '\033[1;33m⚠️ Caveats'
		osascript -e "beep"
	fi

	# if not cask, stop
	[[ "$BREW_INFO" =~ "cask" ]] || return 0

	# shellcheck disable=SC2012
	local NEWEST_APP="$(ls -tc /Applications | head -n1)"
	echo "Open \"$NEWEST_APP\"? (y/n)" # offer to open

	# stop when decision not yes
	read -r -k 1 DECISION
	[[ "$DECISION:l" != "y" ]] && return 0 # ":l" = lowercase https://scriptingosx.com/2019/12/upper-or-lower-casing-strings-in-bash-and-zsh/

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
