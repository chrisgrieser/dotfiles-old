# shellcheck disable=SC1091

DEVICE_NAME="$(scutil --get ComputerName)"

LOG_LOCATION="$(dirname "$0")"/backup.log
echo "" >> "$LOG_LOCATION"
echo "Backup: $(date '+%Y-%m-%d %H:%M'), $BACKUP_DEST -- " >> "$LOG_LOCATION"

INPUT="$*"
BACKUP_DEST="${INPUT/#\~/$HOME}"/Backup_"$DEVICE_NAME"
mkdir -p "$BACKUP_DEST"

BREWDUMP_PATH="$BACKUP_DEST"/install\ lists
mkdir "$BREWDUMP_PATH"
brew bundle dump --force --file "$BREWDUMP_PATH"/Brewfile_"$DEVICE_NAME"
npm list -g --parseable | sed "1d" | sed -E "s/.*\///" > "$BREWDUMP_PATH"/NPMfile_"$DEVICE_NAME"
pip3 freeze | cut -d"=" -f1 > "$BREWDUMP_PATH"/Pip3File_"$DEVICE_NAME"
echo "Brewfile, NPM-File, and Pip3File dumped at \"$BREWDUMP_PATH\""

cd "$BACKUP_DEST" || exit 1
bkp () {
	rsync --archive --progress --delete "$1" "$2"
}

# =========================

# Fonts
bkp ~'/Library/Fonts/' ./Fonts
# shellcheck disable=SC2086

# Preferences
bkp ~'/Library/Preferences' .

# Containers (Pref Location for Mac App Store Apps)
bkp ~'/Library/Containers/com.busymac.busycal3' ./Containers
bkp ~'/Library/Containers/com.agiletortoise.Drafts-OSX' ./Containers
bkp ~'/Library/Containers/com.pixelmatorteam.pixelmator.x' ./Containers
bkp ~'/Library/Containers/com.iconfactory.Twitterrific5' ./Containers
bkp ~'/Library/Containers/com.mimestream.Mimestream' ./Containers
bkp ~'/Library/Containers/com.sindresorhus.Gifski' ./Containers
bkp ~'/Library/Containers/com.giorgiocalderolla.Catch.CatchFeedHelper' ./Containers

# Application Support
bkp ~'/Library/Application Support/BibDesk' ./Application-Support
bkp ~'/Library/Application Support/Alfred' ./Application-Support
bkp ~'/Library/Application Support/BraveSoftware' ./Application-Support

# Home Folder
bkp ~'/Games' ./Homefolder

# iCloud
bkp ~'/Library/Mobile Documents/com~apple~CloudDocs' ./iCloud-Folder

# Movies
bkp ~'/Video' ./Homefolder
bkp ~'/RomComs' ./Homefolder


# =========================

# Log Backup Completion at drive and at this device
echo "completed: $(date '+%H:%M')" >> "$LOG_LOCATION"
echo "Backup: $(date '+%Y-%m-%d %H:%M')" >> last_backup.log

# eject when its a volume
if [[ "$BACKUP_DEST" == *"Volumes"* ]]; then
  diskutil unmount "$BACKUP_DEST"
  diskutil unmount force "$BACKUP_DEST"
fi

# Notify
osascript -e 'display notification "" with title "Backup finished." subtitle "" sound name ""'

# set last backup date in Alfred
osascript -e 'tell application id "com.runningwithcrayons.Alfred" to set configuration "last_backup" to value "'"$(date '+%Y-%m-%d %H:%M')"'" in workflow "de.chris-grieser.backup-utility" '
