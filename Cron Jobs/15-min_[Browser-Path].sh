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

CHROME_FOLDER=~'/Library/Application Support/Google/Chrome'
TARGET_BOOKMARKS=~"/Library/Application Support/$BROWSER/Default/Bookmarks"
CHROME_BOOKMARKS="$CHROME_FOLDER/Default/Bookmarks"

[[ ! -d "$CHROME_FOLDER/Default" ]] && mkdir -p "$CHROME_FOLDER/Default"
if [[ "$TARGET_BOOKMARKS" -nt "$CHROME_BOOKMARKS" ]]; then
	cp -f "$TARGET_BOOKMARKS" "$CHROME_BOOKMARKS"
	cp -f ~"/Library/Application Support/$BROWSER/Local State" "$CHROME_FOLDER/Local State"
fi

# LOGGING
# ---------------------------------------------------
echo "15-min $(date '+%Y-%m-%d %H:%M')" >> '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/Cron Jobs/frequent.log'
