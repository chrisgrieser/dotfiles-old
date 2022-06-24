require("utils")

--------------------------------------------------------------------------------
function vsplitResize (size)
	local resizeAmount = 25

	local win1 = hs.window.orderedWindows()[1]
	local win2 = hs.window.orderedWindows()[2]

	local f1 = win1:frame()
	local f2 = win2:frame()

	if size == "increase" then
		f1.w = f1.w + resizeAmount
		f2.w = f2.w - resizeAmount
		f2.x = f2.x + resizeAmount
	elseif size == "decrease" then
		f1.w = f1.w - resizeAmount
		f2.w = f2.w + resizeAmount
		f2.x = f2.x - resizeAmount
	else
		f1.w = max.w / 2
		f2.w = max.w / 2
		f2.x = max.w / 2
	end

	win1:setFrame(f1)
	win2:setFrame(f2)
end

hs.hotkey.bind(Hyperkey, "pageup", function ()vsplitResize("increase") end, nil, function ()vsplitResize("increase") end)
hs.hotkey.bind(Hyperkey, "pagedown", function ()vsplitResize("decrease") end, nil, function ()vsplitResize("decrease") end)
hs.hotkey.bind(Hyperkey, "home", function ()vsplitResize("reset") end)

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
