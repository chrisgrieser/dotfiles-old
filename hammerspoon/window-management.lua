-- https://www.hammerspoon.org/go/
-------------------------------------

function finderIsFrontmost ()
	local frontapp = hs.application.frontmostApplication():bundleID()
	return frontapp == "com.apple.finder"
end

--------------------------------------------------------------------------------

function moveAndResize(direction)
	local win = hs.window.focusedWindow()
	local position

	if (direction == "left") then
		position = {x=0, y=0, w=0.5, h=1}
	elseif (direction == "right") then
		position = {x=0.5, y=0, w=0.5, h=1}
	elseif (direction == "up") then
		position = {x=0, y=0, w=1, h=0.5}
	elseif (direction == "down") then
		position = {x=0, y=0.5, w=1, h=0.5}
	elseif (direction == "pseudo-maximized") then
		position = {x=0, y=0, w=0.815, h=1}
	elseif (direction == "maximized") then
		position = {x=0, y=0, w=1, h=1}
	elseif (direction == "centered") then
		position = {x=0.2, y=0.1, w=0.6, h=0.8}
	end
	win:moveToUnit(position)
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

hs.hotkey.bind({"ctrl"}, "Space", function ()
	if (finderIsFrontmost()) then
		finderCentered()
	else
		moveAndResize("pseudo-maximized")
	end
end)

--------------------------------------------------------------------------------

-- https://www.hammerspoon.org/go/#winlayout
function homeWindowLayout ()
	local currentScreen = hs.screen.primaryScreen:name()

	local pseudoMaximized = {x=0, y=0, w=0.815, h=1}
	local toTheSide = {x=0.815, y=0, w=0.185, h=1}

	local homeLayout = {
		{"Twitterrific", nil, currentScreen, toTheSide, nil, nil},
		{"Brave Browser", nil, currentScreen, pseudoMaximized, nil, nil},
		{"Sublime Text", nil, currentScreen, pseudoMaximized, nil, nil},
		{"Slack", nil, currentScreen, pseudoMaximized, nil, nil},
		{"Discord", nil, currentScreen, pseudoMaximized, nil, nil},
		{"Obsidian", nil, currentScreen, pseudoMaximized, nil, nil},
		{"Drafts", nil, currentScreen, pseudoMaximized, nil, nil},
		{"Mimestream", nil, currentScreen, pseudoMaximized, nil, nil},
	}
	hs.layout.apply(homeLayout)
end

hs.hotkey.bind(Hyperkey, "W", homeWindowLayout)

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
	if (finderIsFrontmost()) then
		finderVerticalSplit()
	else
		-- vsplit()
	end
end)
