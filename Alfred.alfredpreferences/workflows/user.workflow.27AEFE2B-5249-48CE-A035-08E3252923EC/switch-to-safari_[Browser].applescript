#!/usr/bin/env osascript
tell application "Vivaldi"
		set currentTabUrl to URL of active tab of front window
end tell


-- has to set the URL instead of "open location" (and its equivalents in Shell/JXA)
-- to prevent interaction with finicky
tell application "Safari"
	set the URL of the current tab of the front window to currentTabUrl
	activate
end tell
