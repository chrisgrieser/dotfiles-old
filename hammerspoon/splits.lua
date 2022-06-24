require("utils")

--------------------------------------------------------------------------------
function vsplit (size)
	local resizeAmount = 25

	local win1 = hs.window.orderedWindows()[1]
	local win2 = hs.window.orderedWindows()[2]
	local f1 = win1:frame()
	local f2 = win2:frame()
	local max = win1:screen():frame()

	-- ensure it's a correct split
	if (f1.w + f2.w ~= max.w and size ~= "reset") then
		notify ("not a correct vertical split")
		return
	end

	-- switch up, to ensure that win1 is the right one
	if (f1.x > f2.x) then
		local temp = win1
		win1 = win2
		win2 = temp
		f1 = win1:frame()
		f2 = win2:frame()
	end

	if size == "increase" then
		f1.w = f1.w + resizeAmount
		f2.w = f2.w - resizeAmount
		f2.x = f2.x + resizeAmount
	elseif size == "decrease" then
		f1.w = f1.w - resizeAmount
		f2.w = f2.w + resizeAmount
		f2.x = f2.x - resizeAmount
	elseif size == "switch" then
		f1 = hs.layout.right50
		f2 = hs.layout.left50
	elseif size == "reset" then
		f1 = hs.layout.left50
		f2 = hs.layout.right50
	end

	if (size == "increase" or size == "decrease") then
		win1:setFrame(f1)
		win2:setFrame(f2)
	elseif (size == "switch" or size == "reset") then
		win1:moveToUnit(f1)
		win2:moveToUnit(f2)
	end
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

hs.hotkey.bind(Hyperkey, "V", function()
	if (frontapp() == "Finder") then	finderVsplit()
	else vsplit("reset") end
end)

hs.hotkey.bind(Hyperkey, "X", function() vsplit("switch") end)

hs.hotkey.bind(Hyperkey, "pageup", function ()vsplit("increase") end, nil, function ()vsplit("increase") end)
hs.hotkey.bind(Hyperkey, "pagedown", function ()vsplit("decrease") end, nil, function ()vsplit("decrease") end)
