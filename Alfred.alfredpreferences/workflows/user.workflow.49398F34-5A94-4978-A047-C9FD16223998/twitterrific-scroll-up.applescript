#!/usr/bin/env osascript
tell application "System Events"
	set frontApp to (name of first process where it is frontmost)
	tell application "Twitterrific" to activate
	tell application "System Events"
		# has to be keystrokes, since headless the app doe snot have menubar items to be clicked
		keystroke "1" using {command down}
		keystroke "1" using {command down}
		keystroke "k" using {command down} -- mark as read
	end tell
end tell
tell application frontApp to activate
