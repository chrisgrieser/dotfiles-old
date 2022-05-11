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
tell application id "com.runningwithcrayons.Alfred" to run trigger "toggle-dark-mode" in workflow "com.sirshanksalot.dark-mode-toggle"

# Reminders to Drafts (redundancy with iOS for safety)
tell application "Shortcuts" to run shortcut "Send Reminders due today to Drafts"

# TWITTERIFIC SCROLL UP
# wrapped in try due to Twitterific bug sometimes not
# responding to hotkeys when not clicking into the window once
try
	tell application id "com.runningwithcrayons.Alfred" to run trigger "twitterrific-scroll-up" in workflow "de.chris-grieser.twitter-tweaks"
end try

# BUSYCAL RESTART
# to ensure menubar icon is there
tell application "Busycal"
	activate
	delay 5
	quit
end tell

# log
do shell script "echo $(date '+%Y-%m-%d %H:%M:%S') >> '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Utility Scripts/morning-log.log'"
