require("utils")
--------------------------------------------------------------------------------
-- active window highlight
highlightDuration = 2
function activeWindowHighlight(appName, eventType)
	if (appName == "Alfred") then return end
	local screenWidth = hs.window.focusedWindow():screen():frame().w
	local windowWidth = hs.window.focusedWindow():frame().w
	local windowRelativeWidth = screenWidth / windowWidth
	if (numberOfScreens() == 1 and windowRelativeWidth > 0.75) then return end

	if (eventType == hs.application.watcher.activated) then
		-- Delete an existing highlight if it exists
		if rect then
			rect:delete()
			if rectTimer then
				rectTimer:stop()
			end
		end

		local f = hs.window.focusedWindow():frame()
		rect = hs.drawing.rectangle(f)
		rect:setStrokeWidth(7)
		rect:setFill(false)
		rect:setStrokeColor(hs.drawing.color.green)
		rect:show()

		rectTimer = runDelayed(highlightDuration, function()
			rect:delete()
			rect = nil
		end)

	end
end
appActivationWatcher = hs.application.watcher.new(activeWindowHighlight)
appActivationWatcher:start()

--------------------------------------------------------------------------------
-- app-only Window Switchers
-- https://www.hammerspoon.org/docs/hs.window.switcher.html

finderWindowSwitcher = hs.window.switcher.new{"Finder"}
browserWindowSwitcher = hs.window.switcher.new{"Brave Browser"}
mailWindowSwitcher = hs.window.switcher.new{"Mimestream"}
sublimeWindowSwitcher = hs.window.switcher.new{"Sublime Text"}
obsidianWindowSwitcher = hs.window.switcher.new{"Obsidian"}
draftsWindowSwitcher = hs.window.switcher.new{"Drafts"}
twitterrificWindowSwitcher = hs.window.switcher.new{"Twitterrific"}

function appWindowSwitcher()
	if (frontapp() == "Finder") then
		finderWindowSwitcher:next()
	elseif (frontapp() == "Brave Browser") then
		browserWindowSwitcher:next()
	elseif (frontapp() == "Mimestream") then
		mailWindowSwitcher:next()
	elseif (frontapp() == "Sublime Text") then
		sublimeWindowSwitcher:next()
	elseif (frontapp() == "Obsidian") then
		obsidianWindowSwitcher:next()
	elseif (frontapp() == "Drafts") then
		draftsWindowSwitcher:next()
	elseif (frontapp() == "Twitterrific") then
		twitterrificWindowSwitcher:next()
	end
end

--------------------------------------------------------------------------------
-- WINDOW MOVEMENT

function moveAndResize(direction)
	local win = hs.window.focusedWindow()
	local position

	-- if window moved is from Drafts, toggle sidebars
	if (win:application():name() == "Drafts") then
		if (direction == "pseudo-maximized" or direction == "maximized") then
			hs.application("Drafts"):selectMenuItem({"View", "Show Draft List"})
		else
			hs.application("Drafts"):selectMenuItem({"View", "Hide Draft List"})
		end
	end

	if (direction == "left") then
		position = hs.layout.left50
	elseif (direction == "right") then
		position = hs.layout.right50
	elseif (direction == "up") then
		position = {x=0, y=0, w=1, h=0.5}
	elseif (direction == "down") then
		position = {x=0, y=0.5, w=1, h=0.5}
	elseif (direction == "pseudo-maximized") then
		position = {x=0, y=0, w=0.815, h=1}
	elseif (direction == "maximized") then
		position = hs.layout.maximized
	elseif (direction == "centered") then
		position = {x=0.2, y=0.1, w=0.6, h=0.8}
	end

	-- workaround for https://github.com/Hammerspoon/hammerspoon/issues/2316
	resizingWorkaround(win, position)
end

function resizingWorkaround(win, pos)
	-- replaces `win:moveToUnit(pos)`

	local winApp = win:application():name()
	-- add Applescript-capable apps used to the if-condition below
	-- if (winApp == "Finder" or winApp == "Brave Browser" or winApp == "BusyCal" or winApp == "Safari") then
	if (false) then
		hs.applescript([[
			use framework "AppKit"
			set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
			set max_x to item 1 of item 2 of item 1 of allFrames
			set max_y to item 2 of item 2 of item 1 of allFrames
			]] ..

			"set x to "..pos.x .." * max_x\n" ..
			"set y to "..pos.y .." * max_y\n" ..
			"set w to "..pos.w .." * max_x\n" ..
			"set h to "..pos.h .." * max_y\n" ..
			'tell application "'..winApp..'" to set bounds of front window to {x, y, x + w, y + h}'
		)
	else
		win:moveToUnit(pos)
		-- has to repeat due to bug for some apps... :/
		hs.timer.delayed.new(0.3, function () win:moveToUnit(pos) end):start()
	end
end

--------------------------------------------------------------------------------
-- LAYOUTS & DISPLAYS

function movieModeLayout()
	if not(isProjector()) then return end
	local iMacDisplay = hs.screen.allScreens()[2]
	iMacDisplay:setBrightness(0)

	hs.application.open("YouTube")

	hs.application("Drafts"):kill9()
	hs.application("Slack"):kill9()
	hs.application("Discord"):kill9()
	hs.application("Mimestream"):kill9()
	hs.application("Alfred Preferences"):kill9()
	hs.application("Sublime Text"):kill9()
	hs.application("Obsidian"):kill9()
	hs.application("alacritty"):kill9()
	hs.application("Alacritty"):kill9()
end

function homeModeLayout ()
	if not(isIMacAtHome()) then return end

	local pseudoMaximized = {x=0, y=0, w=0.815, h=1}
	local toTheSide = {x=0.815, y=0, w=0.185, h=1}

	hs.application.open("Mimestream")
	hs.application.open("Discord")
	hs.application.open("Slack")
	hs.application.open("Brave Browser")
	hs.application.open("Obsidian")
	hs.application.open("Twitterrific")
	hs.application.open("Drafts")

	hs.applescript('tell application id "com.runningwithcrayons.Alfred" to run trigger "play" in workflow "com.vdesabou.spotify.mini.player"')

	local screen = hs.screen.primaryScreen():name()
	local homeLayout = {
		{"Twitterrific", nil, screen, toTheSide, nil, nil},
		{"Brave Browser", nil, screen, pseudoMaximized, nil, nil},
		{"Sublime Text", nil, screen, pseudoMaximized, nil, nil},
		{"Slack", nil, screen, pseudoMaximized, nil, nil},
		{"Discord", nil, screen, pseudoMaximized, nil, nil},
		{"Obsidian", nil, screen, pseudoMaximized, nil, nil},
		{"Drafts", nil, screen, pseudoMaximized, nil, nil},
		{"Mimestream", nil, screen, pseudoMaximized, nil, nil},
		{"alacritty", nil, screen, pseudoMaximized, nil, nil},
		{"Alacritty", nil, screen, pseudoMaximized, nil, nil},
	}
	hs.layout.apply(homeLayout)
	hs.timer.delayed.new(0.3, function () hs.layout.apply(homeLayout) end):start()
end

function officeModeLayout ()
	if not(isAtOffice()) then return end
	local screen1 = hs.screen.allScreens()[1]
	local screen2 = hs.screen.allScreens()[2]

	local maximized = hs.layout.maximized
	local bottom = {x=0, y=0.5, w=1, h=0.5}
	local topLeft = {x=0, y=0, w=0.515, h=0.5}
	local topRight = {x=0.51, y=0, w=0.49, h=0.5}

	local officeLayout = {
		{"Twitterrific", "@pseudo_meta - Home", screen2, topLeft, nil, nil},
		{"Twitterrific", "@pseudo_meta - List", screen2, topRight, nil, nil},
		{"Discord", nil, screen2, bottom, nil, nil},
		{"Slack", nil, screen2, bottom, nil, nil},

		{"Brave Browser", nil, screen1, maximized, nil, nil},
		{"Sublime Text", nil, screen1, maximized, nil, nil},
		{"Obsidian", nil, screen1, maximized, nil, nil},
		{"Drafts", nil, screen1, maximized, nil, nil},
		{"Mimestream", nil, screen1, maximized, nil, nil},
		{"alacritty", nil, screen1, maximized, nil, nil},
		{"Alacritty", nil, screen1, maximized, nil, nil},
	}

	hs.layout.apply(officeLayout)
	hs.timer.delayed.new(0.3, function () hs.layout.apply(officeLayout) end):start()

	hs.application("Slack"):mainWindow():raise()
end

function displayCountWatcher()
	if (isProjector()) then
		movieModeLayout()
	elseif (isIMacAtHome()) then
		homeModeLayout()
	end
end
displayWatcher = hs.screen.watcher.new(displayCountWatcher)
displayWatcher:start()

function moveWindowToMouseScreen(win)
	local mouseScreen = hs.mouse.getCurrentScreen()
	local screenOfWindow = win:screen()
	if (mouseScreen:name() == screenOfWindow:name()) then return end
	win:moveToScreen(mouseScreen)
end

-- Open windows always on the screen where the mouse is
function alwaysOpenOnMouseDisplay(appName, eventType, appObject)
	if numberOfScreens() == 1 then return end

	if (eventType == hs.application.watcher.launched) then
		-- delayed, to ensure window has launched properly
		runDelayed(0.5, function ()
			local appWindow = appObject:focusedWindow()
			moveWindowToMouseScreen(appWindow)
		end)
	elseif (appName == "Brave Browser" and hs.application.watcher.activated and isProjector()) then
		runDelayed(0.5, function ()
			local appWindow = appObject:focusedWindow()
			moveWindowToMouseScreen(appWindow)
		end)
	end
end
launchWhileMultiScreenWatcher = hs.application.watcher.new(alwaysOpenOnMouseDisplay)
launchWhileMultiScreenWatcher:start()

function moveToOtherDisplay ()
	local win = hs.window.focusedWindow()
	local targetScreen = win:screen():next()
	win:moveToScreen(targetScreen, true)

	-- workaround for ensuring proper resizing
	runDelayed(0.25, function ()
		win_ = hs.window.focusedWindow()
		win_:setFrameInScreenBounds(win_:frame())
	end)
end

--------------------------------------------------------------------------------
-- SPLITS

function vsplit (mode)
	local win1 = hs.window.orderedWindows()[1]
	local win2 = hs.window.orderedWindows()[2]
	local f1 = win1:frame()
	local f2 = win2:frame()
	local max = win1:screen():frame()

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
		if (f1.w == f2.w) then
			f1 = hs.layout.right50
			f2 = hs.layout.left50
		else
			f1 = hs.layout.right30
			f2 = hs.layout.left70
		end
	elseif mode == "split" then
		if (f1.w == f2.w) then
			f1 = hs.layout.left70
			f2 = hs.layout.right30
		else
			f1 = hs.layout.left50
			f2 = hs.layout.right50
		end
	end

	resizingWorkaround(win1, f1)
	resizingWorkaround(win2, f2)

	hs.timer.delayed.new(0.3, function () resizingWorkaround(win1, f1) end):start()
	hs.timer.delayed.new(0.3, function () resizingWorkaround(win2, f2) end):start()
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
-- HOTKEYS

hotkey(hyper, "Up", function() moveAndResize("up") end)
hotkey(hyper, "Down", function() moveAndResize("down") end)
hotkey(hyper, "Right", function() moveAndResize("right") end)
hotkey(hyper, "Left", function() moveAndResize("left") end)
hotkey(hyper, "Space", function() moveAndResize("maximized") end)
hotkey(hyper, "pagedown", function() moveToOtherDisplay() end)
hotkey(hyper, "pageup", function() moveToOtherDisplay() end)

hotkey(hyper, "home", function()
	if isAtOffice() then
		officeModeLayout()
	else
		homeModeLayout()
	end
end)

hotkey({"ctrl"}, "Space", function ()
	if (frontapp() == "Finder") then
		moveAndResize("centered")
	elseif isAtOffice() then
		moveAndResize("maximized")
	else
		moveAndResize("pseudo-maximized")
	end
end)

hotkey(hyper, "X", function() vsplit("switch") end)
hotkey(hyper, "V", function()
	if (frontapp() == "Finder") then
		finderVsplit()
	else
		vsplit("split")
	end
end)

hotkey({"alt"}, "tab", appWindowSwitcher)
