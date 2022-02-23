# shellcheck disable=SC1091

# Import BREWDUMP_PATH and `dump` function
source ../zsh/homebrew.zsh
dump

logLoc="$(dirname "$0")"/backup.log
backup_dest="$1"
device_name=$(scutil --get ComputerName)
cd "$backup_dest" || exit 1

# -------------------------------------------


# Log Backup Start
echo -n "Backup: $(date '+%Y-%m-%d %H:%M'),to $backup_dest -- " >> "$logLoc"

# Backup Location from Alfred Workflow

# Creates Folder with current date
mkdir ./Backup\ "$(date '+%Y-%m-%d_%H.%M')"

# goes to the newly created folder
cd "$(find . -name "Backup*" -maxdepth 1 -mtime -10s)"

#=========================

# Preferences
cp -vR ~'/Library/Preferences' .

# Containers (Pref Location for Mac App Store Apps)
cp -vR ~'/Library/Containers/com.busymac.busycal3' ./Containers
cp -vR ~'/Library/Containers/com.agiletortoise.Drafts-OSX' ./Containers
cp -vR ~'/Library/Containers/com.pixelmatorteam.pixelmator.x' ./Containers
cp -vR ~'/Library/Containers/com.iconfactory.Twitterrific5' ./Containers
cp -vR ~'/Library/Containers/com.mimestream.Mimestream' ./Containers
cp -vR ~'/Library/Containers/com.sindresorhus.Gifski' ./Containers
cp -vR ~'/Library/Containers/com.giorgiocalderolla.Catch.CatchFeedHelper' ./Containers

# Application Support
cp -vR ~'/Library/Application Support/BibDesk' ./Application-Support
cp -vR ~'/Library/Application Support/Alfred' ./Application-Support
cp -vR ~'/Library/Application Support/BraveSoftware' ./Application-Support

# Fonts
cp -vR ~'/Library/Fonts' ./Fonts

# Home Folder
mkdir -p 'Homefolder/Games'
sleep 0.5
cp -vR ~'/Games' ./Homefolder

# iCloud
cp -vR ~'/Library/Mobile Documents/com~apple~CloudDocs' ./iCloud-Folder

mkdir -p 'Homefolder/Video'
cp -vR ~'/Video' ./Homefolder
mkdir -p 'Homefolder/RomComs'
cp -vR ~'/RomComs' ./Homefolder


#=========================

# Log Backup completion
echo "completed: $(date '+%H:%M')\n" >> $logLoc

#eject when its a volume
if [[ $backup_dest == *"Volumes"* ]]; then
  diskutil unmount $backup_dest
  diskutil unmount force $backup_dest
fi

osascript -e 'tell application id "com.runningwithcrayons.Alfred" to set configuration "last_backup" to value "'"$(date '+%Y-%m-%d %H:%M')"'" in workflow "de.chris-grieser.backup-utility" '

osascript -e 'display notification "" with title "Backup finished." subtitle "" sound name ""'




# ---------------

brew bundle dump --force --file "$BREWDUMP_PATH"/Brewfile_"$DEVICE_NAME"
npm list -g --parseable | sed "1d" | sed -E "s/.*\///" > "$BREWDUMP_PATH"/NPMfile_"$DEVICE_NAME"

