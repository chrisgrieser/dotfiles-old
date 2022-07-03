#!/usr/bin/env osascript

on run argv
	set langArg to item 1 of argv

	set prevClipboard to the clipboard
	delay 0.1
	tell application "System Events"
		key code 123 -- char left
		key code 124 using {option down} -- word right
		key code 123 using {option down, shift down} -- word left selection
		keystroke "c" using {command down} -- copy
	end tell
	delay 0.1
	set theWord to the clipboard
	delay 0.1
	set the clipboard to prevClipboard

	set theFixedWord to do shell script "export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH
	dym --clean-output -n1 " & langArg & " \"" & theWord & "\""

	tell application "System Events" to keystroke "v" using {command down}

end run

