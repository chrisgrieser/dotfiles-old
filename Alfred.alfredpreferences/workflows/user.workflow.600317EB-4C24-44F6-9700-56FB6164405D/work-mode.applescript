#!/usr/bin/env osascript

-- quit zoom without asking for confirmation
do shell script ("killall 'zoom.us' || true")

-- Play Spotify
tell application id "com.runningwithcrayons.Alfred" to run trigger "play" in workflow "com.vdesabou.spotify.mini.player" with argument ""

-- Start apps
tell application "Mimestream" to if it is not running then activate
tell application "Brave Browser" to if it is not running then activate
tell application "BusyCal" to if it is not running then activate
tell application "Slack" to if it is not running then activate
tell application "Discord" to if it is not running then activate

-- reset Drafts (Actions contains focus mode off already)
tell application "Drafts" to open location "drafts://x-callback-url/runaction?&action=Workspace-Basic"

--jump to top in Twitterific
tell application "Twitterrific" to if it is not running then activate
repeat until application "Twitterrific" is running
	delay 0.1
end repeat
tell application "System Events"
	tell process "Twitterrific"
		set frontmost to true
		click menu item "Mark Timeline as Read" of menu "Timeline" of menu bar 1
		click menu item "Jump to Unread" of menu "Timeline" of menu bar 1
	end tell
end tell

delay 0.2
tell application "Moom" to arrange windows according to snapshot "💼 Work"
