#!/usr/bin/env osascript
tell application "Chromium"
		set currentTabUrl to URL of active tab of front window
		set currentTabTitle to title of active tab of front window
end tell

set markdownlink to "[" & currentTabTitle & "](" & currentTabUrl & ")"

--copy selection
set the clipboard to ""
tell application "System Events" to keystroke "c" using {command down}
delay 0.1
set sel to (the clipboard as text)
if sel is not "" then set markdownlink to ("\"" & sel & "\"" & " " & markdownlink)

-- create draft
tell application "Drafts"
	make new draft with properties {content:markdownlink, tags:{"URL", "via " & (system attribute "chromium_browser")}}
end tell

-- for notification
if sel is "" then
	return currentTabTitle
else
	return sel
end if
