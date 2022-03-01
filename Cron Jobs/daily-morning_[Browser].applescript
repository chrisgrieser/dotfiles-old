#!/usr/bin/env osascript

# sleep timer
tell application "--YouTube" to if it is running then quit
tell application "Vivaldi"
	if ((count of window) is not 0)
		if ((count of tab of front window) is not 0)
			set currentTabUrl to URL of active tab of front window
			if (currentTabUrl contains "youtu") then close active tab of front window
		end if
	end if
end tell

delay 1

# switch to light mode
# to work without workaround, requires chrome://flag ➞ #extensions-on-chrome-urls
tell application "System Events"
	tell appearance preferences to set dark mode to false
end tell


# Reset some Stuff
tell application id "com.runningwithcrayons.Alfred" to run trigger "twitterrific-scroll-up" in workflow "de.chris-grieser.twitter-tweaks" with argument ""
delay 1
tell application id "com.surteesstudios.Bartender" to launch
tell application "KeeWeb" to if it is running then quit

