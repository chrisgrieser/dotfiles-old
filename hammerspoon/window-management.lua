-- https://www.hammerspoon.org/go/
-------------------------------------

Hyperkey = {"cmd", "alt", "ctrl", "shift"}

function moveAndResize(direction)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h

	if (direction == "left") then
		f.w = max.w / 2
	elseif (direction == "right") then
		f.w = max.w / 2
		f.x = max.x + (max.w / 2)
	elseif (direction == "up") then
		f.h = max.h / 2
	elseif (direction == "down") then
		f.h = max.h / 2
		f.y = max.y + (max.h / 2)
	elseif (direction == "pseudo-maximized") then
		f.w = max.w * 0.815
	elseif (direction == "centered") then
		f.x = max.x + (max.w * 0.2)
		f.y = max.y + (max.h * 0.1)
		f.w = max.w * 0.6
		f.h = max.h * 0.8
	end
	win:setFrame(f)
end

function finderCentered ()
	hs.applescript([[
use framework "AppKit"
set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
set max_x to item 1 of item 2 of item 1 of allFrames
set max_y to item 2 of item 2 of item 1 of allFrames

set x to 0.2 * max_x
set y to 0.1 * max_y
set w to 0.6 * max_x
set h to 0.8 * max_y
tell application "Finder" to set bounds of window 1 to {x, y, x + w, y + h}
	]])
end

hs.hotkey.bind(Hyperkey, "Up", function () moveAndResize("up") end)
hs.hotkey.bind(Hyperkey, "Down", function () moveAndResize("down") end)
hs.hotkey.bind(Hyperkey, "Right", function () moveAndResize("right") end)
hs.hotkey.bind(Hyperkey, "Left", function () moveAndResize("left") end)
hs.hotkey.bind(Hyperkey, "Space", function () moveAndResize("maximized") end)
hs.hotkey.bind(Hyperkey, "Space", function () moveAndResize("maximized") end)
hs.hotkey.bind({"ctrl"}, "Space", function ()
	local frontapp = hs.application.frontmostApplication():bundleID()
	if (frontapp == "com.apple.finder") then
		-- moveAndResize("centered")
		finderCentered()
	else
		moveAndResize("pseudo-maximized")
	end
end)


--------------------------------------------------------------------------------

function vsplit()
	local win1 = hs.window.focusedWindow()
	local win2 = hs.window.focusedWindow() -- TODO need to look for the right window
	local screen = win1:screen()
	local max = screen:frame()

	-- left side
	local f1 = win1:frame()
	f1.x = max.x
	f1.y = max.y
	f1.w = max.w / 2
	f1.h = max.h
	win1:setFrame(f1)

	-- right side
	local f2 = win2:frame()
	f2.x = max.x + (max.w / 2)
	f2.y = max.y
	f2.w = max.w / 2
	f2.h = max.h
	win2:setFrame(f2)
end

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
	local frontapp = hs.application.frontmostApplication():bundleID()
	if (frontapp == "com.apple.finder") then
		finderVerticalSplit()
	else
		-- vsplit()
	end
end)
