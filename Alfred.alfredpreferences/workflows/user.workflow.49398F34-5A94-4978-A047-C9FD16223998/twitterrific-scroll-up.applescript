#!/usr/bin/env osascript
tell application "System Events"
	set frontApp to (name of first process where it is frontmost)
	tell application "Twitterrific" to activate
	tell application "System Events"
		# has to be keystrokes, since headless the app does not have menubar items to be clicked
		keystroke "k" using {command down} -- mark as read
		keystroke "j" using {command down} -- jump to unread
	end tell
end tell
tell application frontApp to activate
