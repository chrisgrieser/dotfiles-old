-- Open folder, maximized and in Icon View

-- CONFIG
set targetPath to "~/RomComs/"

-- RESOLVE
set AppleScript's text item delimiters to "~/"
set theTextItems to every text item of targetPath
set AppleScript's text item delimiters to (POSIX path of (path to home folder as string))
set targetPath to theTextItems as string

-- RESIZE
use framework "AppKit" -- this line has to appear before the "on run" line of Alfred (or other functions) *)
set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
set X to item 1 of item 2 of item 1 of allFrames -- main screen
set Y to item 2 of item 2 of item 1 of allFrames
set topLeftX to 0
set topLeftY to 0
set width2 to X
set height to Y

-- OPEN
tell application "Finder"
	open (targetPath as POSIX file)
	activate
	set bounds of Finder window 1 to {topLeftX, topLeftY, width2, height}
end tell

-- Icon View
tell application "System Events"
	tell process "Finder" to click menu item "as Icons" of menu "View" of menu bar 1
end tell