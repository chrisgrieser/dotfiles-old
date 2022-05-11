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

-- Reset to workspace depending on location
if (isOffice is false) then
	set workspace to "Home"
else
	set workspace to "Office"
end if
tell application "Drafts" to open location ("drafts://x-callback-url/runaction?&action=Workspace-" & workspace)

-- Twitterific: no more headless
if (isOffice is true) then
	do shell script "defaults write com.iconfactory.Twitterrific5 advancedShowDockIcon -bool YES"
	tell application "Twitterrific"
		quit
		delay 0.1
		activate
	end tell
end if

-- Twitterific: scroll up
tell application id "com.runningwithcrayons.Alfred" to run trigger "twitterrific-scroll-up" in workflow "de.chris-grieser.twitter-tweaks" with argument ""

-- arrange windows
delay 0.1
tell application "Moom" to arrange windows according to snapshot "💼 Work"

-- headless again
if (isOffice is true) then
	delay 0.1
	do shell script "defaults write com.iconfactory.Twitterrific5 advancedShowDockIcon -bool NO"
	tell application "Twitterrific"
		quit
		delay 0.1
		activate
	end tell
end if
