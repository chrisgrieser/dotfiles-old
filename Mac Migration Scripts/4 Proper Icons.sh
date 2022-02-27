#!/bin/zsh
# shellcheck disable=SC2033
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
unalias cp # no confirmation needed for this

# ---------------------
# Regular Updating
# ---------------------
iconsur set "/Applications/Steam.app"
iconsur set "/Applications/zoom.us.app"
iconsur set "/Applications/PDF Expert.app"

ICON_FOLDER=~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/'
# Alfred Prefs
cp "$ICON_FOLDER"'Alfred Prefs.icns' '/Applications/Alfred 4.app/Contents/Preferences/Alfred Preferences.app/Contents/Resources/appicon.icns'
touch '/Applications/Alfred 4.app/Contents/Preferences/Alfred Preferences.app'
# Transmission
cp "$ICON_FOLDER"'Transmission 2.icns' '/Applications/Transmission.app/Contents/Resources/Transmission.icns'
touch '/Applications/Transmission.app'
# VLC
cp "$ICON_FOLDER"'VLC.icns' '/Applications/VLC.app/Contents/Resources/VLC.icns'
touch '/Applications/VLC.app'
# Cryptomator
cp "$ICON_FOLDER"'Cryptomator.icns' '/Applications/Cryptomator.app/Contents/Resources/Cryptomator.icns'
touch '/Applications/Cryptomator.app'
# Obsidian
cp "$ICON_FOLDER"'Obsidian_Square.icns' '/Applications/Obsidian.app/Contents/Resources/icon.icns'
touch '/Applications/Obsidian.app'
# Alacritty
cp "$ICON_FOLDER"'Alacritty.icns' '/Applications/Alacritty.app/Contents/Resources/alacritty.icns'
touch '/Applications/Alacritty.app'
# Vivaldi
cp "$ICON_FOLDER"'Vivaldi Red.icns' '/Applications/Vivaldi.app/Contents/Resources/app.icns'
touch '/Applications/Vivaldi.app'
# Sublime
cp "$ICON_FOLDER"'Sublime Text Brown.icns' '/Applications/Sublime Text.app/Contents/Resources/Sublime Text.icns'
touch '/Applications/Sublime Text.app'

killall Finder

#######################
# stopstring-for-alfred
#######################

# ----------------------
# Progressive Web Apps
# ----------------------
ICON_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/"
VIDEO_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Chrome Apps.localized/"
unalias cp # no confirmation needed for this

cp "$ICON_FOLDER/YouTube.icns" "$VIDEO_FOLDER/YouTube.app/Contents/Resources/app.icns"
touch "$VIDEO_FOLDER/YouTube.app"
iconsur set "$VIDEO_FOLDER/Tagesschau.app"
iconsur --input "$ICON_FOLDER/BunnyFap.png" --scale 1.1 set "$VIDEO_FOLDER/BunnyFap.app"
iconsur set "$VIDEO_FOLDER/Netflix.app"
iconsur set "$VIDEO_FOLDER/Twitch.app"
iconsur -k "Unread" set "$VIDEO_FOLDER/Inoreader.app"
# iconsur -l set "$VIDEO_FOLDER/Excalidraw.app"

iconsur cache
alias cp='cp -i' # restore


# ----------------------
# Other
# --------------------
sudo -v
unalias cp # no confirmation needed for this
ICON_FOLDER=~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/'

# Excel
sudo cp "$ICON_FOLDER"'Excel.icns' '/Applications/Microsoft Excel.app/Contents/Resources/XCEL.icns'
sudo touch '/Applications/Microsoft Excel.app'
# Powerpoint
sudo cp "$ICON_FOLDER"'Powerpoint.icns' '/Applications/Microsoft Powerpoint.app/Contents/Resources/PPT3.icns'
sudo touch '/Applications/Microsoft Powerpoint.app'
# Word
sudo cp "$ICON_FOLDER"'Word.icns' '/Applications/Microsoft Word.app/Contents/Resources/MSWD.icns'
sudo touch '/Applications/Microsoft Word.app'
# AppCleaner
cp "$ICON_FOLDER"'AppCleaner.icns' '/Applications/AppCleaner.app/Contents/Resources/AppCleaner.icns'
touch '/Applications/AppCleaner.app'

# Drafts
osascript -e 'tell application "Finder" to open information window of ("/Applications/Drafts.app" as POSIX file as alias)
tell application "Finder" to activate
set the clipboard to POSIX file "'"$ICON_FOLDER"'/Drafts_Green.icns"'

# Mimestream
osascript -e 'tell application "Finder" to open information window of ("/Applications/Mimestream.app" as POSIX file as alias)
tell application "Finder" to activate
set the clipboard to POSIX file "'"$ICON_FOLDER"'/Mail_fancy.icns"'

iconsur -l set "/Applications/The Unarchiver.app"
iconsur -l set "/Applications/Subtitles.app"

# shellcheck disable=SC2032
alias cp='cp -i' # restore
iconsur cache
