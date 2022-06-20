-- https://www.hammerspoon.org/go/
-------------------------------------

-- auto-reload config when file changes
function reloadConfig(files)
	doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
configWatcher:start()
hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()

-- Bring all Finder windows forward & hide sidebar when activated
function finderWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.activated) then
		if (appName == "Finder") then
			appObject:selectMenuItem({"Window", "Bring All to Front"})
			appObject:selectMenuItem({"View", "Hide Sidebar"})
		end
	end
end
finderAppWatcher = hs.application.watcher.new(finderWatcher)
finderAppWatcher:start()

-- Open OMG Server instead of Friends tab
function discordWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.launching) then
		if (appName == "Discord") then
			hs.applescript('tell Application "Discord" to open location "discord://discord.com/channels/686053708261228577/700466324840775831"')
		end
	end
end
discordAppWatcher = hs.application.watcher.new(discordWatcher)
discordAppWatcher:start()

-- Open Highlights in right Dark/Light Mode
function highlightsWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.launching) then
		if (appName == "Highlights") then
			hs.applescript([[
tell application "System Events"
	tell appearance preferences to set isDark to dark mode
	if (isDark is false) then set targetView to "Default"
	if (isDark is true) then set targetView to "Night"
	delay 0.5

	tell process "Highlights"
		set frontmost to true
		click menu item targetView of menu of menu item "PDF Appearance" of menu "View" of menu bar 1
	end tell
end tell
]])
		end
	end
end
highlightsAppWatcher = hs.application.watcher.new(highlightsWatcher)
highlightsAppWatcher:start()

-- Dim brightness when second monitor is attached
function displayCountWatcher()
	hs.notify.new({title="Hammerspoon", informativeText="Screen Layout changed"}):send()
	hs.applescript("do shell script \"shortcuts run 'Zero Brightness'\"")
end
displayWatcher = hs.screen.watcher.new(displayCountWatcher)
displayWatcher:start()

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "W", function()
	-- "hs.brightness.set" does not work when second display is conncted
	-- "tell application Shortcuts to run..." would leave Shortcuts open
	-- therefor this workaround
	-- aScreen = hs.screen.allScreens()
	screenCount = table.getn{n=1000}
	hs.alert.show(screenCount)
end)
