#!/usr/bin/env osascript
on run argv
	set input to argv as string
	open location "https://www.hammerspoon.org/docs/index.html"

	delay 0.2
	tell application "Brave Browser"
		repeat until (loading of active tab of front window is false)
			delay 0.2
		end repeat
	end tell
	delay 0.3

	tell application "System Events"
		keystroke tab
		delay 0.1
		keystroke input
		delay 0.3
		key code 53
		delay 0.1
		keystroke "f" -- vimium f
	end tell
end run
