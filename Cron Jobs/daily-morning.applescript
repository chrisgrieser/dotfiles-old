#!/usr/bin/env osascript

# sleep timer
tell application "YouTube" to if it is running then quit
tell application "-YouTube" to quit
tell application "KeeWeb" to if it is running then quit
tell application "Brave Browser"
	if ((count of window) is not 0)
		if ((count of tab of front window) is not 0)
			set currentTabUrl to URL of active tab of front window
			if (currentTabUrl contains "youtu") then close active tab of front window
		end if
	end if
end tell

delay 1

# switch to light mode
tell application "System Events" to tell appearance preferences to set isDarkMode to dark mode
if isDarkMode then tell application id "com.runningwithcrayons.Alfred" to run trigger "toggle-dark-mode" in workflow "com.sirshanksalot.dark-mode-toggle" with argument ""

# Scroll up with Twitterific
tell application "System Events"
	tell process "Twitterrific"
		set frontmost to true
		click menu item "Mark Timeline as Read" of menu "Timeline" of menu bar 1
		click menu item "Jump to Unread" of menu "Timeline" of menu bar 1
	end tell
end tell

delay 1
tell application id "com.surteesstudios.Bartender" to launch

