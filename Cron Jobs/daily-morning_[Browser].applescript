#!/usr/bin/env osascript

# SLEEP TIMER
tell application "-YouTube" to if it is running then quit
tell application "Brave Browser"
	if ((count of window) is not 0)
		if ((count of tab of front window) is not 0)
			set currentTabUrl to URL of active tab of front window
			if (currentTabUrl contains "youtu") then close active tab of front window
		end if
	end if
end tell

delay 1

# SWITCH TO LIGHT MODE
tell application "System Events" to tell appearance preferences to set dark mode to true
tell application id "com.runningwithcrayons.Alfred" to run trigger "toggle-dark-mode" in workflow "com.sirshanksalot.dark-mode-toggle" with argument ""

# RESET SOME STUFF
tell application "KeeWeb" to if it is running then quit
delay 0.5
tell application id "com.runningwithcrayons.Alfred" to run trigger "twitterrific-scroll-up" in workflow "de.chris-grieser.twitter-tweaks" with argument ""
delay 3
tell application "System Events"
	tell process "Drafts"
		set frontmost to true
		click menu item "Hide Toolbar" of menu "View" of menu bar 1
	end tell
end tell
delay 5
tell application id "com.surteesstudios.Bartender" to launch
delay 5
tell application "xbar"
	quit
	delay 1
	launch
end tell

# log
do shell script "echo $(date '+%Y-%m-%d %H:%M:%S') > '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Utility Scripts/morning-log.log'"
