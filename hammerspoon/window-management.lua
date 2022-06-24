require("utils")

-- ⌥ ↹ – Window Switcher, only for Browser and Finder Windows
--https://www.hammerspoon.org/docs/hs.window.switcher.html
windowSwitcher = hs.window.switcher.new{"Finder"}
windowSwitcher = hs.window.switcher.new{"Brave Browser"}
windowSwitcher = hs.window.switcher.new{"Mimestream"}
hs.hotkey.bind({"alt"}, "tab", function() windowSwitcher:next() end)

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

	-- workaround for https://github.com/Hammerspoon/hammerspoon/issues/2316
	resizingWorkaround(win, position)

	-- if window moved is from Drafts, toggle sidebars
	if (win:application():name() == "Drafts") then
		if (direction == "pseudo-maximized" or direction == "maximized") then
			hs.application("Drafts"):selectMenuItem({"View", "Show Draft List"})
		else
			hs.application("Drafts"):selectMenuItem({"View", "Hide Draft List"})
		end
	end

end

function resizingWorkaround(win, pos)
	local winApp = win:application():name()
	-- add Applescript-capable apps you are using to the if-condition below
	if (winApp == "Finder" or winApp == "Brave Browser" or winApp == "BusyCal" or winApp == "Safari") then
		hs.applescript([[
			use framework "AppKit"
			set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
			set max_x to item 1 of item 2 of item 1 of allFrames
			set max_y to item 2 of item 2 of item 1 of allFrames
			]] ..

			"set x to " .. pos.x .. " * max_x\n" ..
			"set y to " .. pos.y .. " * max_y\n" ..
			"set w to " .. pos.w .. " * max_x\n" ..
			"set h to " .. pos.h .. " * max_y\n" ..
			'tell application "' .. winApp .. '" to set bounds of front window to {x, y, x + w, y + h}'
		)
	else
		win:moveToUnit(pos)
	end
end

hs.hotkey.bind(Hyperkey, "Up", function () moveAndResize("up") end)
hs.hotkey.bind(Hyperkey, "Down", function () moveAndResize("down") end)
hs.hotkey.bind(Hyperkey, "Right", function () moveAndResize("right") end)
hs.hotkey.bind(Hyperkey, "Left", function () moveAndResize("left") end)
hs.hotkey.bind(Hyperkey, "Space", function () moveAndResize("maximized") end)

hs.hotkey.bind({"ctrl"}, "Space", function ()
	if (frontapp() == "Finder") then
		moveAndResize("centered")
	else
		moveAndResize("pseudo-maximized")
	end
end)

--------------------------------------------------------------------------------

-- https://www.hammerspoon.org/go/#winlayout
function homeWindowLayout ()
	local currentScreen = hs.screen.primaryScreen():name()

	local pseudoMaximized = {x=0, y=0, w=0.815, h=1}
	local toTheSide = {x=0.815, y=0, w=0.185, h=1}

	hs.application.open("Mimestream")
	hs.application.open("Discord")
	hs.application.open("Slack")
	hs.application.open("Brave Browser")
	hs.application.open("Obsidian")
	hs.application.open("Twitterrific")

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

--------------------------------------------------------------------------------

-- PROJECTOR: Dim brightness when projector is connected
function displayCountWatcher()
	local isProjector = hs.screen.primaryScreen():name() == "ViewSonic PJ"
	local isIMacAtHome = hs.screen.primaryScreen():name() == "Built-in Retina Display"

	if (isProjector) then
		-- "hs.brightness.set" does not work when second display is mirrored
		-- therefore using Shortcuts instead
		hs.shortcuts.run('Zero Brightness')
		hs.application.open("YouTube")
		hs.application("Drafts"):kill9()
		hs.application("Slack"):kill9()
		hs.application("Discord"):kill9()
		hs.application("Mimestream"):kill9()
	elseif (isIMacAtHome) then
		hs.brightness.set(50)
		homeWindowLayout()
	end
end
displayWatcher = hs.screen.watcher.new(displayCountWatcher)
displayWatcher:start()
