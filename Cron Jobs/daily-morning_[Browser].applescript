#!/usr/bin/env osascript

# SLEEP TIMER
do shell script "killall \"YouTube\" || true"

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
tell application "System Events"
	tell appearance preferences
		if (dark mode is true) then tell application id "com.runningwithcrayons.Alfred" to run trigger "toggle-dark-mode" in workflow "com.sirshanksalot.dark-mode-toggle"
	end tell
end tell

# REMINDERS TO DRAFTS
# (redundancy with iOS for safety)
# with shell script as opposed to Applescript, as Shortcuts.app isn't activated
do shell script "shortcuts run \"Send Reminders due today to Drafts\""

-- HIDE DRAFTS TOOLBAR
try
	tell application "System Events"
		tell process "Drafts"
			set frontmost to true
			click menu item "Hide Toolbar" of menu "View" of menu bar 1
		end tell
	end tell
end try

# BUSYCAL RESTART
# to ensure menubar icon is there
tell application "Busycal"
	activate
	delay 5
	quit
end tell

# LOGGING
do shell script "echo Morning\\ $(date '+%Y-%m-%d %H:%M') >> '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/Cron Jobs/some.log'"
