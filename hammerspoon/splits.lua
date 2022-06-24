require("utils")

--------------------------------------------------------------------------------
function vsplitResize ()
	local win1 = hs.window.orderedWindows()[1]
	local win2 = hs.window.orderedWindows()[2]
	local f1 = win1:frame()
	local f2 = win2:frame()

	f2.x = f2.x + 40
	f1.w = f1.w + 20
	f2.w = f2.w - 20

	win1:setFrame(f1)
	win2:setFrame(f2)
end

hs.hotkey.bind(Hyperkey, "pagedown", vsplitResize)

--------------------------------------------------------------------------------
function finderVerticalSplit ()
	hs.applescript([[
		use framework "AppKit"
		set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
		set screenWidth to item 1 of item 2 of item 1 of allFrames
		set screenHeight to item 2 of item 2 of item 1 of allFrames

		set vsplit to {{0, 0, 0.5 * screenWidth, screenHeight}, {0.5 * screenWidth, 0, screenWidth, screenHeight} }

		tell application "Finder"
			if ((count windows) is 0) then return
			if ((count windows) is 1) then
				set currentWindow to target of window 1 as alias
				make new Finder window to folder currentWindow
			end if
			set bounds of window 1 to item 2 of vsplit
			set bounds of window 2 to item 1 of vsplit
		end tell
]])
end

hs.hotkey.bind(Hyperkey, "V", function()
	if (frontapp() == "Finder") then
		finderVerticalSplit()
	end
end)
