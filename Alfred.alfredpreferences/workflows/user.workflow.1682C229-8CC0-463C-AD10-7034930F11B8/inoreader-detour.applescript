#!/usr/bin/env osascript
tell application "System Events" to keystroke "v" using
delay 0.3
tell application "Brave Browser"
	repeat until (loading of active tab of front window is false)
		delay 0.1
	end repeat
end tell
delay 0.1
