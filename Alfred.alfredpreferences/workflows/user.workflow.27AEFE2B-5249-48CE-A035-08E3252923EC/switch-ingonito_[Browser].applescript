#!/usr/bin/env osascript

if application "Chromium" is running then
	tell application "Chromium"
			set theURL to URL of active tab of front window
			make new window with properties {mode:"incognito"}
			delay 0.5
			set URL of active tab of front window to theURL
	end tell
else
	display notification with title ("Vivaldi not running")
end if

