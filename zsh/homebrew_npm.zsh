# Configs https://docs.brew.sh/Manpage#environment
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=90
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_INSTALL_BADGE=✅

alias dev='npm run dev'
alias build='npm run build'

alias re='brew reinstall'
alias un='brew uninstall --zap'

function br {
	# shellcheck disable=SC1009,SC1056,SC1072,SC1073
	SELECTED=$( { brew formulae ; brew casks } | fzf --query "$*" --preview 'HOMEBREW_COLOR=true brew info {}' --bind 'alt-enter:execute(brew home {})+abort' --preview-window=right:65%)
	if [[ $? == 0 ]]; then
		in "$SELECTED"
	fi
}

function in (){
	TO_INSTALL="$1"
	TYPE="$2" # formula or cask

	# quotes would add empty 2nd arg if empty
	# get attention when there is a caveat, `\033[1;33m` = bold yellow
	# shellcheck disable=SC2086
	HOMEBREW_COLOR=true brew install --no-quarantine "$TO_INSTALL" $TYPE | \
		sed -e 's/\[1mCaveats/\[1;33m⚠️⚠️ Caveats ⚠️⚠️/' \
		|| return # guard clause to ensure that the input exists and is a cask

	# guard clause: if not cask, stop
	brew info "$TO_INSTALL" --cask &> /dev/null || return 0

	# shellcheck disable=SC2012
	NEWEST_APP="$(ls -tc /Applications | head -n1)"
	echo "Open \"$NEWEST_APP\"? (y/n)" # offer to open
	read -r -k 1 DECISION
	if [[ "$DECISION" == "y" ]] ; then
		open -a "$NEWEST_APP"
	fi
}

function print-section () {
	echo ""
	echo "$*"
	echo "---------------"
}

function dump () {
	device_name=$(scutil --get ComputerName)
	brew bundle dump --force --file "$BREWDUMP_PATH"/Brewfile_"$device_name"
	npm list -g --parseable | sed "1d" | sed -E "s/.*\///" > "$BREWDUMP_PATH"/NPMfile_"$device_name"
	echo "Brewfile and NPMfile dumped at \"$BREWDUMP_PATH\""
}

function update (){
	print-section "Homebrew"
	brew update
	brew upgrade
	brew cleanup
	brew autoremove

	print-section "Mac App Store"
	mas upgrade

	print-section "NPM"
	npm update -g

	print-section "fig"
	fig update

	print-section "Pip3"
	pip3 install --upgrade pdfannots

	print-section "Dump Installs"
	dump

	osascript -e 'display notification "" with title "Updates finished."	'
}

function report (){
	print-section "Homebrew"
	brew tap
	brew list
	brew doctor
	echo "Homebrew Leaves (installed on request)"
	brew leaves --installed-on-request
	echo "Homebrew Leaves (installed as dependency)"
	brew leaves --installed-as-dependency
	echo "Homebrew Casks"
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
