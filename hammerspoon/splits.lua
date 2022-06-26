require("utils")

--------------------------------------------------------------------------------
function vsplit (mode)
	local win1 = hs.window.orderedWindows()[1]
	local win2 = hs.window.orderedWindows()[2]
	local f1 = win1:frame()
	local f2 = win2:frame()
	local max = win1:screen():frame()
	local size

	-- switch up, to ensure that win1 is the right one
	if (f1.x > f2.x) then
		local temp = win1
		win1 = win2
		win2 = temp
		f1 = win1:frame()
		f2 = win2:frame()
	end

	-- switch order of windows
	if mode == "switch" then
		if (f1.w + f2.w ~= max.w) then
			notify ("not a correct vertical split")
			return
		end
		f1 = hs.layout.right50
		f2 = hs.layout.left50
	else
		-- 50-50 -> 70-30
		if (f1.w == f2.w) then
			f1 = hs.layout.left70
			f2 = hs.layout.right30
		-- 70-30 -> 50-50
		else
			f1 = hs.layout.left50
			f2 = hs.layout.right50
		end
	end

	win1:moveToUnit(f1)
	win2:moveToUnit(f2)
end

function finderVsplit ()
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
--------------------------------------------------------------------------------

hotkey(hyper, "V", function()
	if (frontapp() == "Finder") then	finderVsplit()
	else vsplit("50-50") end
end)

hotkey(hyper, "X", function() vsplit("switch") end)
