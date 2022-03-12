#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

ICON_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/"
PWA_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Brave Browser Apps.localized/"
cd /Applications/ || exit 1

APP_TO_UPDATE="$*"
APP_TO_UPDATE="${APP_TO_UPDATE%.*}" # no extension

# ---------------------

case "$APP_TO_UPDATE" in
	"Steam") iconsur set "Steam.app" ;;
   "zoom.us") iconsur set "zoom.us.app" ;;
   "PDF Expert") iconsur set "PDF Expert.app" ;;
   "Alfred Prefs")
		iconsur set "PDF Expert.app"
		;;
   *) echo "No custom icon defined for $APP_TO_UPDATE" ;;
esac

touch "$APP_TO_UPDATE"
iconsur cache


# ---------------------

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
# Alacritty
cp "$ICON_FOLDER"'Alacritty.icns' '/Applications/Alacritty.app/Contents/Resources/alacritty.icns'
touch '/Applications/Alacritty.app'
# Sublime
cp "$ICON_FOLDER"'Sublime Text Brown.icns' '/Applications/Sublime Text.app/Contents/Resources/Sublime Text.icns'
touch '/Applications/Sublime Text.app'


# ----------------------
# Progressive Web Apps
# ----------------------

cp "$ICON_FOLDER/YouTube.icns" "$PWA_FOLDER/-YouTube.app/Contents/Resources/app.icns"
touch "$PWA_FOLDER/-YouTube.app"
iconsur set "$PWA_FOLDER/-Tagesschau.app"
iconsur set "$PWA_FOLDER/-Netflix.app"
iconsur --input "$ICON_FOLDER/BunnyFap.png" --scale 1.1 set "$PWA_FOLDER/-BunnyFap.app"
iconsur set "$PWA_FOLDER/-Twitch.app"

iconsur -k "Unread" set "$PWA_FOLDER/Inoreader.app"

cp "$ICON_FOLDER/Google Docs.icns" "$PWA_FOLDER/Google Docs.app/Contents/Resources/app.icns"
touch "$PWA_FOLDER/Google Docs.app"

# AppCleaner
cp "$ICON_FOLDER"'AppCleaner.icns' '/Applications/AppCleaner.app/Contents/Resources/AppCleaner.icns'
touch '/Applications/AppCleaner.app'
iconsur -l set "/Applications/Subtitles.app"

# Drafts
osascript -e 'tell application "Finder" to open information window of ("/Applications/Drafts.app" as POSIX file as alias)
tell application "Finder" to activate
set the clipboard to POSIX file "'"$ICON_FOLDER"'/Drafts_Green.icns"'

# Mimestream
osascript -e 'tell application "Finder" to open information window of ("/Applications/Mimestream.app" as POSIX file as alias)
tell application "Finder" to activate
set the clipboard to POSIX file "'"$ICON_FOLDER"'/Mail_fancy.icns"'

