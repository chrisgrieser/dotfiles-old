#!/usr/bin/env osascript

--get variables
set zoom_url to do shell script ("echo " & quoted form of (system attribute "zoom_url") & " | iconv -f UTF-8-MAC -t MACROMAN")
set notes to (system attribute "notes")

--open Zoom meeting
tell application "zoom.us" to open location "zoom_url"

--volume & music
set volume output volume 70
tell application id "com.runningwithcrayons.Alfred" to run trigger "pause" in workflow "com.vdesabou.spotify.mini.player" with argument ""

-- open Drafts for note-taking
if (notes is "drafts") then
	tell application "Drafts" to open location "drafts://x-callback-url/runaction?&action=Workspace-Basic%20(note-taking)"
	repeat until (application "Drafts" is running)
		delay 0.2
	end repeat
	-- wait till Zoom meeting has started
	set nameList to ""
	repeat until nameList contains "Zoom Meeting"
		tell application "System Events" to set nameList to name of windows of (processes whose name is "zoom.us")
		set nameList to item 1 of nameList
		delay 0.2
	end repeat
	delay 0.5

	tell application "Moom" to arrange windows according to snapshot "📝 Drafts + Zoom"
	display notification "" with title "📝 Note Mode ready"
end if

-- maximize Zoom when not a special context
if (notes is "none") then

	-- wait till Zoom meeting has started
	set nameList to ""
	repeat until nameList contains "Zoom Meeting"
		tell application "System Events" to set nameList to name of windows of (processes whose name is "zoom.us")
		set nameList to item 1 of nameList
		delay 0.2
	end repeat
	delay 0.5

	-- maximize Zoom
	tell application "System Events"
		tell process "zoom.us"
			set frontmost to true
			click menu item "Zoom" of menu "Window" of menu bar 1
		end tell
	end tell
end if

-- Seminar Preparation
if (notes contains "obsidian") then

	-- open Obsidian notes & Excalidraw
	tell application "Obsidian"
		open location notes
		repeat until application "Obsidian" is running
			delay 0.2
		end repeat
		delay 0.1
	end tell

	-- open ExcaliDraw (this way to prevent triggering due to AppleScript Bug)
	do shell script ("open -a Excalidraw")

	-- Quit apps
	tell application "Twitterrific" to if it is running then quit
	tell application "Drafts" to if it is running then quit
	tell application "BusyCal" to if it is running then quit
	tell application "BibDesk" to if it is running then quit
	tell application "Keeweb" to if it is running then quit
	tell application "Discord" to if it is running then quit
	tell application "Slack" to if it is running then quit
	tell application "Mimestream" to if it is running then quit

	-- Pause
	repeat until (application "Mimestream" is not running)
		delay 0.2
	end repeat
	delay 0.1

	-- wait till Zoom meeting has started
	set meetingWindow to ""
	repeat until meetingWindow contains "Zoom Meeting"
		tell application "System Events" to set nameList to name of windows of (processes whose name is "zoom.us")
		set meetingWindow to item 1 of nameList
		delay 0.2
	end repeat
	delay 0.5

	-- minimize the unneeded window
	tell application "System Events"
		click (first button of window "Zoom" of process "zoom.us" whose role description is "minimize button")
	end tell

	-- Moom
	tell application "Moom" to arrange windows according to snapshot "👨‍🏫 Seminar"
	display notification "" with title "👨‍🏫 Seminar Mode ready"
	delay 0.2

end if
