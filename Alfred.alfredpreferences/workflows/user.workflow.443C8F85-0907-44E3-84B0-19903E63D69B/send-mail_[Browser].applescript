#!/usr/bin/env osascript
set AppleScript's text item delimiters to ""

do shell script ("pbcopy < /dev/null")
tell application "System Events" to keystroke "c" using {command down}
delay 0.2
set tabSelection to the clipboard


tell application "Chromium"
	set tabUrl to URL of active tab of front window
	set tabTitle to title of active tab of front window
end tell

set mailto_command to "mailto:?subject=FYI: " & tabTitle & "&body="
if (tabSelection is not "") then set mailto_command to mailto_command & "> \"" & tabSelection & "\"" & "\n\n"
set mailto_command to mailto_command & tabUrl
return mailto_command
