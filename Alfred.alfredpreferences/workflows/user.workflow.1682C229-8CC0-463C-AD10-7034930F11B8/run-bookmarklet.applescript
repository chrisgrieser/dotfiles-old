#!/usr/bin/env osascript


tell application "System Events"
	tell process (system attribute "browser")
		set frontmost to true
		click menu item (system attribute "bookmarklet_name") of menu of menu item Bookmarklets of menu "Bookmarks" of menu bar 1
	end tell
end tell

-- tell application "System Events"
-- 	-- workaround, as Obsidian does not react otherwise
-- 	key code 123 using {shift down}
-- 	key code 124
-- end tell
