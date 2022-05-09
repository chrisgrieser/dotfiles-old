#!/usr/bin/env osascript

-- quit zoom without asking for confirmation
do shell script ("killall 'zoom.us' || true")

-- Play Spotify
tell application id "com.runningwithcrayons.Alfred" to run trigger "play" in workflow "com.vdesabou.spotify.mini.player" with argument ""

-- Start apps
tell application "Mimestream" to if it is not running then activate
tell application "Brave Browser" to if it is not running then activate
tell application "Slack" to if it is not running then activate
tell application "Discord" to if it is not running then activate

-- reset Drafts (Actions contains focus mode off already)
tell application "Drafts" to open location "drafts://x-callback-url/runaction?&action=Workspace-Home"

-- jump to top in Twitterific
tell application "Twitterrific" to if it is not running then activate
repeat until application "Twitterrific" is running
	delay 0.1
end repeat
tell application id "com.runningwithcrayons.Alfred" to run trigger "twitterrific-scroll-up" in workflow "de.chris-grieser.twitter-tweaks" with argument ""

delay 0.2
tell application "Moom" to arrange windows according to snapshot "💼 Work"
