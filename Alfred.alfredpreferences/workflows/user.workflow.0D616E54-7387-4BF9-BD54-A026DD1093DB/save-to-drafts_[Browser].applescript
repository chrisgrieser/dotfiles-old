#!/usr/bin/env osascript
on run argv
	set AppleScript's text item delimiters to ""
	set input to argv as string
	if input is not "" then
		if frontmost of application "Brave Browser" then
			tell application "Brave Browser"
					set currentTabUrl to URL of active tab of front window
					set currentTabTitle to title of active tab of front window
			end tell
			set output to "[" & currentTabTitle & "](" & currentTabUrl & ")"
		else
			set output to input
		end if
		tell application "Drafts" to make new draft with properties {content: output}
		return output -- for notification
	end if
end run
