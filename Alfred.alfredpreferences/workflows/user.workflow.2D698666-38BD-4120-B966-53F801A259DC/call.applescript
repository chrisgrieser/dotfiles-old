#!/usr/bin/env osascript
-- use framework "AppKit"
on run argv
	-- replace spaces with "%20"
	set AppleScript's text item delimiters to "%20"
	set phoneNumber to argv as string
	set phoneURI to "tel://" & phoneNumber

	tell application "FaceTime" to open location (phoneURI)

	-- set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
	-- set screenWidth to item 1 of item 2 of item 1 of allFrames

	-- set x to screenWidth - 50
	-- set y to 60

	-- tell application "System Events" to click at {x, y} -- click "Call" on the notice
end run
