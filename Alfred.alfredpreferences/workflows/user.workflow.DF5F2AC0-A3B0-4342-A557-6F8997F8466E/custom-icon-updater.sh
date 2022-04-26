#!/bin/zsh
# shellcheck disable=SC2154
# requires "iconsur"

CUSTOM_ICON_FOLDER="${custom_icon_folder/#\~/$HOME}"
PWA_FOLDER="${pwa_folder/#\~/$HOME}"

cd "/Applications/" || exit 1
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

# ----------------------



# only app name
APP_TO_UPDATE=$(basename "$*")
APP_TO_UPDATE="${APP_TO_UPDATE%.*}" # no extension
NONE_FOUND=0
INFO_WINDOW=0

case $APP_TO_UPDATE in
	"Steam")
		iconsur set "Steam.app" ;;
   "zoom.us")
		iconsur set "zoom.us.app" ;;
   "PDF Expert")
		iconsur set "PDF Expert.app" ;;
	"Subtitles")
		iconsur -l set "Subtitles.app" ;;

   "Transmission")
		cp "$CUSTOM_ICON_FOLDER/Transmission 2.icns" '/Transmission.app/Contents/Resources/Transmission.icns'
		touch "Transmission.app" ;;
   "Alfred Preferences")
		cp "$CUSTOM_ICON_FOLDER/Alfred Prefs.icns" 'Alfred 4.app/Contents/Preferences/Alfred Preferences.app/Contents/Resources/appicon.icns'
		touch 'Alfred 4.app/Contents/Preferences/Alfred Preferences.app/Contents/Resources/appicon.icns' ;;
	"VLC")
		cp "$CUSTOM_ICON_FOLDER/VLC.icns" 'VLC.app/Contents/Resources/VLC.icns'
		touch "VLC.app" ;;
	"Cryptomator")
		cp "$CUSTOM_ICON_FOLDER/Cryptomator.icns" 'Cryptomator.app/Contents/Resources/Cryptomator.icns'
		touch "Cryptomator.app" ;;
	"Alacritty")
		cp "$CUSTOM_ICON_FOLDER/Alacritty.icns" 'Alacritty.app/Contents/Resources/alacritty.icns'
		touch "Alacritty.app" ;;
	"Sublime")
		cp "$CUSTOM_ICON_FOLDER/Sublime Text Brown.icns" 'Sublime Text.app/Contents/Resources/Sublime Text.icns'
		touch "Sublime Text.app" ;;
	"AppCleaner")
		cp "$CUSTOM_ICON_FOLDER/AppCleaner.icns" 'AppCleaner.app/Contents/Resources/AppCleaner.icns'
		touch "AppCleaner.app" ;;
	"Obsidian")
		cp "$CUSTOM_ICON_FOLDER/Obsidian Square.icns" 'Obsidian.app/Contents/Resources/icon.icns'
		touch "Obsidian.app" ;;
	"MacPass")
		cp "$CUSTOM_ICON_FOLDER/MacPass.icns" 'MacPass.app/Contents/Resources/MacPassAppIcon.icns'
		touch "MacPass.app" ;;
	"Discord")
		cp "$CUSTOM_ICON_FOLDER/Discord Black.icns" 'Discord.app/Contents/Resources/electron.icns'
		touch "Discord.app" ;;

	"Microsoft Word")
		osascript -e "tell application \"Finder\"
			open information window of (\"/Applications/Microsoft Word.app\" as POSIX file as alias)
			activate
		end tell
		set the clipboard to POSIX file \"$CUSTOM_ICON_FOLDER/Word.icns\""
		INFO_WINDOW=1 ;;
	"Microsoft Excel")
		osascript -e "tell application \"Finder\"
			open information window of (\"/Applications/Microsoft Excel.app\" as POSIX file as alias)
			activate
		end tell
		set the clipboard to POSIX file \"$CUSTOM_ICON_FOLDER/Excel.icns\""
		INFO_WINDOW=1 ;;
	"Mimestream")
		# osascript -e "tell application \"Finder\"
		# 	open information window of (\"/Applications/Mimestream.app\" as POSIX file as alias)
		# 	activate
		# end tell
		# set the clipboard to POSIX file \"$CUSTOM_ICON_FOLDER/Mail_fancy.icns\""
		# INFO_WINDOW=1 ;;
		cp "$CUSTOM_ICON_FOLDER/Mail_fancy.icns" 'Mimestream.app/Contents/Resources/AppIcon.icns'
		touch "Mimestream.app" ;;


	"Google Docs"|"Docs")
		cp "$CUSTOM_ICON_FOLDER/Google Docs.icns" "$PWA_FOLDER/Google Docs.app/Contents/Resources/app.icns"
		touch "$PWA_FOLDER/Google Docs.app" ;;
	"Inoreader")
		iconsur -k "Unread" set "$PWA_FOLDER/Inoreader.app" ;;
	"-YouTube"|"YouTube")
		cp "$CUSTOM_ICON_FOLDER/YouTube.icns" "$PWA_FOLDER/-YouTube.app/Contents/Resources/app.icns"
		touch "$PWA_FOLDER/-YouTube.app" ;;
	"-Tagesschau"|"Tagesschau")
		iconsur set "$PWA_FOLDER/-Tagesschau.app" ;;
	"-Netflix"|"Netflix")
		iconsur set "$PWA_FOLDER/-Netflix.app" ;;
	"-Twitch"|"Twitch")
		iconsur set "$PWA_FOLDER/-Twitch.app" ;;
	"-BunnyFap"|"BunnyFap")
		iconsur --input "$CUSTOM_ICON_FOLDER/BunnyFap.png" --scale 1.1 set "$PWA_FOLDER/-BunnyFap.app" ;;

   *)
		NONE_FOUND=1 ;;
esac

if [[ $NONE_FOUND == 0 ]]; then
	killall "$APP_TO_UPDATE"
	if [[ $INFO_WINDOW == 0 ]]; then
		killall "Finder"
		killall "Dock"
		sleep 2.5
		open -a "$APP_TO_UPDATE"
	fi
	echo -n "$APP_TO_UPDATE" # pass for notication
else
	echo -n "No icon set up for $APP_TO_UPDATE."
fi



