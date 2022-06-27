#!/usr/bin/env osascript
on run argv
	open location "https://www.hammerspoon.org/docs/index.html"
	set the clipboard to argv as string

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
		keystroke "v" using {command down}
		delay 0.2
		keystroke return
		delay 0.2
		key code 53
		delay 0.1
		keystroke "f" -- vimium f
	end tell
end run
