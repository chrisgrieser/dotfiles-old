#!/usr/bin/env osascript

-- some aspects of this script depend on the device used
set isOffice to (computer name of (system info) is "Christopher’s Mac mini")

-- quit Zoom, start Spotify
if (isOffice is false) then
	tell application id "com.runningwithcrayons.Alfred" to run trigger "play" in workflow "com.vdesabou.spotify.mini.player"
	do shell script ("killall 'zoom.us' || true")
end if

-- Start apps
tell application "Mimestream" to if it is not running then activate
tell application "Brave Browser" to if it is not running then activate
tell application "Slack" to if it is not running then activate
tell application "Discord" to if it is not running then activate
if (isOffice is false) then
	tell application "Twitterrific" to if it is not running then activate
else
	tell application "Tweetdeck" to if it is not running then activate
end

-- Reset to workspace depending on location
if (isOffice is false) then
	set workspace to "Home"
else
	set workspace to "Office"
end if
tell application "Drafts" to open location ("drafts://x-callback-url/runaction?&action=Workspace-" & workspace)

-- Hide damn toolbar
try
	tell application "System Events"
		tell process "Drafts"
			set frontmost to true
			click menu item "Hide Toolbar" of menu "View" of menu bar 1
		end tell
	end tell
end try

