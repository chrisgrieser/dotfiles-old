#!/usr/bin/env osascript

-- works for any browser, as long as Bookmarklet is in the right folder
tell application "System Events"
	tell first process where it is frontmost
		click menu item "Clip Article" of menu of menu item "Bookmarklets" of menu "Bookmarks" of menu bar 1
	end tell
end tell

-- tell application "System Events"
-- 	-- workaround, as Obsidian does not react otherwise
-- 	key code 123 using {shift down}
-- 	key code 124
-- end tell
