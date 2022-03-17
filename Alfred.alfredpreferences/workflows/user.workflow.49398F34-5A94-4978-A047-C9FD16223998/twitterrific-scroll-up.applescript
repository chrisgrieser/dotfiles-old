#!/usr/bin/env osascript
tell application "System Events"
	set frontApp to (name of first process where it is frontmost)
	tell process "Twitterrific"
		set frontmost to true
		click menu item "Mark Timeline As Read" of menu "Timeline" of menu bar 1
		click menu item "Jump to Unread" of menu "Timeline" of menu bar 1
		click menu item "Refresh Timeline" of menu "Timeline" of menu bar 1
	end tell
end tell
tell application frontApp to activate
