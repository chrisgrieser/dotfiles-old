#!/usr/bin/env osascript

tell application "Brave Browser"
	set windowList to every tab of every window
	repeat with tabList in windowList
		set tabList to tabList as any
		repeat with tabItr in tabList
			set tabItr to tabItr as any
			delete tabItr
		end repeat
	end repeat
end tell
