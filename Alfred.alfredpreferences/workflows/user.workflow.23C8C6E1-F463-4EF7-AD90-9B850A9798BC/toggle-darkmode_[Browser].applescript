#!/usr/bin/env osascript

-- Workaround for Dark Reader not toggling when inactive
tell application "Vivaldi"
	set currentTabUrl to URL of active tab of front window
	set currentTabTitle to title of active tab of front window
end tell

# open tab if there is no tab open to ensure Dark Reader switches as well
set BrowserWasntRunning to false
tell application "Vivaldi"
		set tabcount to 0
		set currentTabUrl to ""
		try
			set tabcount to number of tabs in front window
		end try
		if (tabcount > 0) then set currentTabUrl to URL of active tab of front window

		if (tabcount is 0 or currentTabUrl is "chrome://newtab/")
			open location "https://example.com/"
			repeat until (loading of active tab of front window is false)
				delay 0.1
			end repeat
			delay 0.2
			set BrowserWasntRunning to true
		end if
		delay 0.1
end tell

# toggle dark mode
tell application "System Events"
	tell appearance preferences to set dark mode to not dark mode
end tell

# close tab again
if (BrowserWasntRunning)
	delay 0.2
	tell application "Vivaldi" to close active tab of front window
end if
