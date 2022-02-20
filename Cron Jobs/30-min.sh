#!/bin/zsh
# shellcheck disable=SC2016

# GIT BACKUPS
# ----------------------------------------------------
zsh ~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/Meta/git vault backup.sh"
zsh ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/git-dotfile-backup.sh"


# DOWNLOAD FOLDER BADGE
# ----------------------------------------------------
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
folder=~"/Video/Downloaded"
cache_location=~"/Library/Caches/dl-badge_last-change"
icons_path=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/Download with Badge Icons/"
# to ensure cache existence on new machines
touch "$cache_location"

last_change=$(cat "$cache_location")
# shellcheck disable=SC2012
itemCount=$(ls "$folder" | wc -l)
# reduced by one to account for the "?Icon" file in the folder
itemCount=$((itemCount-1))

# badge
if [[ $itemCount > 0 ]] && [[ $last_change != "badge" ]] ; then
	fileicon set "$folder" "$icons_path""Downloads with Badge.icns"
	echo "badge" > "$cache_location"
	killall Dock
fi

# no badge
if [[ $itemCount == 0 ]] && [[ $last_change == "badge" ]] ; then
	fileicon set "$folder" "$icons_path""Downloads.icns"
	echo "" > "$cache_location"
	killall Dock
fi

# SYNC BRAVE BOOKMARKS TO CHROME BOOKMARKS FOR ALFRED
# ---------------------------------------------------
# move bookmarks
mkdir -p ~'/Library/Application Support/Google/Chrome/Default'
cp ~'/Library/Application Support/BraveSoftware/Brave-Browser/Default/Bookmarks' ~'/Library/Application Support/Google/Chrome/Default/Bookmarks'
# this file is needed as Alfred uses it to verify the existence of Chrome
cp ~'/Library/Application Support/BraveSoftware/Brave-Browser/Local State' ~'/Library/Application Support/Google/Chrome/Local State'
# move history (used by Searchlink)
cp ~'/Library/Application Support/BraveSoftware/Brave-Browser/Default/History' ~'/Library/Application Support/Google/Chrome/Default/History'


# MOVE SCANS INTO FILEHUB
# -----------------------
cd ~"/Library/Mobile Documents/iCloud~com~geniussoftware~GeniusScan/Documents" || exit
if [[ ! -z "$(ls .)" ]] ; then
	mv ./* ../../com~apple~CloudDocs/File\ Hub
fi
