#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
subl --project ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Sublime User Folder/vimrcs.sublime-project"

osascript -e "tell application \"System Events\"
	tell process \"Sublime Text\"
		click menu item \"Zoom\" of menu \"Window\" of menu bar 1
	end tell
end tell"
