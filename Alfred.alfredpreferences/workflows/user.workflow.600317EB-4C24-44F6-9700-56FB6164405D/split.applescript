-- this line has to appear before functions("on run")
use framework "AppKit"

on alfred_script(q)
	tell application "System Events" to set frontApp to (name of first process where it is frontmost)

	tell application frontApp to if ((count windows) is 0) then return

	set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
	set screenWidth to item 1 of item 2 of item 1 of allFrames
	set screenHeight to item 2 of item 2 of item 1 of allFrames

	set vsplit to {{0, 0, 0.5 * screenWidth, screenHeight}, {0.5 * screenWidth, 0, screenWidth, screenHeight} }
	set hsplit to {{0, 0, screenWidth, 0.5 * screenHeight}, {0, 0.5 * screenHeight, screenWidth, screenHeight} }
	set typeOfSplit to q


	if ( ¬
		frontApp is "Finder" or ¬
		frontApp is "Brave Browser" or ¬
		frontApp is "Vivaldi" or ¬
		frontApp is "Google Chrome" or ¬
		frontApp is "Safari" or ¬
	) then
		tell application frontApp

			if ((count windows) is 0) then return

			if ((count windows) is 1) then
				if (frontApp is not "Finder") then
					make new window
				else
					# duplicate current window, if there is only one
					set currentWindow to target of window 1 as alias
					make new Finder window to folder currentWindow
				end if
			end if

			if (typeOfSplit is "vertical-split")
				set bounds of window 1 to item 2 of vsplit
				set bounds of window 2 to item 1 of vsplit
			else
				set bounds of window 1 to item 2 of hsplit
				set bounds of window 2 to item 1 of hsplit
			end if

		end tell
	end if

end alfred_script