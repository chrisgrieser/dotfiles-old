#!/usr/bin/env osascript
tell application (system attribute "chromium_browser")
	using terms from application "Chromium"
		set currentTabUrl to URL of active tab of front window
	end using terms from
end tell


-- has to set the URL instead of "open location" (and its equivalents in Shell/JXA)
-- to prevent interaction with finicky
tell application "Safari"
	set the URL of the current tab of the front window to currentTabUrl
	activate
end tell
