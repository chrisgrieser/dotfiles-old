#!/usr/bin/env osascript

set browser to (system attribute "chromium_browser")
if application browser is running then
	tell application browser
		using terms from application "Chromium"
			set theURL to URL of active tab of front window
			make new window with properties {mode:"incognito"}
			delay 0.5
			set URL of active tab of front window to theURL
		end using terms from
	end tell
else
	display notification with title (browser & " not running")
end if

