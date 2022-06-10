#!/bin/zsh
# shellcheck disable=SC2016

# GIT BACKUPS
# ----------------------------------------------------
zsh ~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/Meta/git vault backup.sh"
zsh ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/git-dotfile-backup.sh"

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
if [[ $itemCount -gt 0 ]] && [[ $last_change != "badge" ]] ; then
	fileicon set "$folder" "$icons_path""Downloads with Badge.icns"
	echo "badge" > "$cache_location"
	killall Dock
fi

# no badge
if [[ $itemCount -eq 0 ]] && [[ $last_change == "badge" ]] ; then
	fileicon set "$folder" "$icons_path""Downloads.icns"
	echo "" > "$cache_location"
	killall Dock
fi

# SYNC BRAVE BOOKMARKS TO CHROME BOOKMARKS FOR ALFRED
# ---------------------------------------------------
BROWSER="BraveSoftware/Brave-Browser"

mkdir -p ~'/Library/Application Support/Google/Chrome/Default'
cp ~"/Library/Application Support/$BROWSER/Default/Bookmarks" ~"/Library/Application Support/Google/Chrome/Default/Bookmarks"
cp ~"/Library/Application Support/$BROWSER/Local State" ~"/Library/Application Support/Google/Chrome/Local State"
cp ~"/Library/Application Support/$BROWSER/Default/History" ~"/Library/Application Support/Google/Chrome/Default/History"

# LOGGING
# ---------------------------------------------------
echo "30-min $(date '+%Y-%m-%d %H:%M')" >> '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/Cron Jobs/frequent.log'
