#!/usr/bin/env osascript

on run argv

	set panelNumber to item 1 of argv
	tell application "Chromium" to activate
	tell application "System Events" to keystroke panelNumber using {command down}

end run
