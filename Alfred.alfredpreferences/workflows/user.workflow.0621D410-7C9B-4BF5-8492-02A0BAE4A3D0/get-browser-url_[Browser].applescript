#!/usr/bin/env osascript
tell application "Brave Browser" to return URL of active tab of front window

-- also works with YouTube Progressive Web App

tell application "Brave Browser"
		set window_list to every window
		repeat with the_window in window_list
			set tab_list to every tab in the_window
			repeat with the_tab in tab_list
				set the_url to the URL of the_tab
				if (the_url contains )
			end repeat
		end repeat
end tell
