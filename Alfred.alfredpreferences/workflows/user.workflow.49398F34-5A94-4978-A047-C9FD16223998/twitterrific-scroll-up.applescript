#!/usr/bin/env osascript
tell application "System Events" to set frontApp to (name of first process where it is frontmost)
tell application "Twitterrific" to activate
tell application "System Events"
	keystroke "k" using {command down}
	keystroke "j" using {command down}
end tell
tell application frontApp to activate
