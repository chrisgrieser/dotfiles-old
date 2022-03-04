#!/bin/zsh
DEVICE_NAME="$(scutil --get ComputerName)"

# Log
LOG_LOCATION="$(dirname "$0")"/backup.log
echo "" >> "$LOG_LOCATION"
echo "Backup: $(date '+%Y-%m-%d %H:%M'), $INPUT -- " >> "$LOG_LOCATION"

# Backup location
INPUT="$*"
BACKUP_DEST="${INPUT/#\~/$HOME}"/Backup_"$DEVICE_NAME"
mkdir -p "$BACKUP_DEST"
cd "$BACKUP_DEST" || exit 1

# Brew Dumps
BREWDUMP_PATH="$BACKUP_DEST"/install\ lists
mkdir "$BREWDUMP_PATH"
brew bundle dump --force --file "$BREWDUMP_PATH"/Brewfile_"$DEVICE_NAME"
npm list -g --parseable | sed "1d" | sed -E "s/.*\///" > "$BREWDUMP_PATH"/NPMfile_"$DEVICE_NAME"
pip3 freeze | cut -d"=" -f1 > "$BREWDUMP_PATH"/Pip3File_"$DEVICE_NAME"
echo "Brewfile, NPM-File, and Pip3File dumped at \"$BREWDUMP_PATH\""

# rsync function
bkp () {
	# ⚠️ `--delete` option will remove backup when source folder is empty!
	# `-hhh` highes level of human readable
	rsync --archive --progress --delete -hhh --exclude="*/.Trash/*" "$1" "$2"
}

# =========================

bkp ~'/Library/Preferences' .
bkp ~'/Library/Application Support/Alfred' ./Application-Support
bkp ~'/Library/Fonts/' ./Fonts
bkp ~'/Games' ./Homefolder
bkp ~'/Video' ./Homefolder
bkp ~'/RomComs' ./Homefolder
bkp ~'/Library/Mobile Documents/com~apple~CloudDocs' ./iCloud-Folder
bkp ~'/Library/Application Support/Vivaldi/Default/' ./Vivaldi-Default-Folder

# =========================

# Log
echo "completed: $(date '+%H:%M')" >> "$LOG_LOCATION"
echo "Backup: $(date '+%Y-%m-%d %H:%M')" >> last_backup.log
osascript -e 'tell application id "com.runningwithcrayons.Alfred" to set configuration "last_backup" to value "'"$(date '+%Y-%m-%d %H:%M')"'" in workflow "de.chris-grieser.backup-utility" '

# eject when volume
if [[ "$BACKUP_DEST" == *"Volumes"* ]] ; then
  diskutil unmount "$BACKUP_DEST"
  diskutil unmount force "$BACKUP_DEST"
fi

# Notify Completion
osascript -e 'display notification "" with title "Backup finished." subtitle "" sound name ""'
