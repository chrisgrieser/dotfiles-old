#!/usr/bin/env osascript
tell application "System Events"
	set frontApp to (name of first process where it is frontmost)
	tell application "Twitterrific" to activate
	delay 0.1
	tell application "System Events"
		# has to be keystrokes, since headless the app does not have menubar items to be clicked
		keystroke "k" using {command down} -- mark as read
		keystroke "j" using {command down} -- jump to unread
		keystroke "1" using {command down} -- jump to unread
	end tell
end tell
delay 0.1
tell application frontApp to activate
