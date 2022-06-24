function twitterrificScrollUp ()
	-- needs activation, cause sending to app in bg does not work with cmd key
	local previousApp = hs.application.frontmostApplication():name()

	hs.application("Twitterrific"):activate()
	hs.eventtap.keyStroke({"cmd"}, "k") -- mark all as red
	hs.eventtap.keyStroke({"cmd"}, "j") -- scroll up
	hs.eventtap.keyStroke({"cmd"}, "1") -- scroll up failsafe
	hs.eventtap.keyStroke({}, "down") -- enable j/k movement

	hs.application(previousApp):activate()
end

function pagedownAction ()
	if isRunning("IINA") then
		hs.eventtap.keyStroke({}, "right", 1, hs.application("IINA"))
	else
		hs.eventtap.keyStroke({}, "down", 1, hs.application("Twitterrific"))
	end
end
function pageupAction ()
	if isRunning("IINA") then
		hs.eventtap.keyStroke({}, "left", 1, hs.application("IINA"))
	else
		hs.eventtap.keyStroke({}, "up", 1, hs.application("Twitterrific"))
	end
end
function homeAction ()
	if isRunning("IINA") then
		hs.eventtap.keyStroke({}, "Space", 1, hs.application("IINA"))
	else
		hs.application("Twitterrific"):activate()
	end
end

-- IINA: pasteboard fix for URLs
function iinaLaunch(appName, eventType, appObject)
	if (eventType == hs.application.watcher.launching) then
		if (appName == "IINA") then
			appObject:selectMenuItem({"Video", "Enter Full Screen"})
		end
	end
end
iinaAppLauncher = hs.application.watcher.new(iinaLaunch)
iinaAppLauncher:start()



--------------------------------------------------------------------------------

hs.hotkey.bind({}, "pagedown", pagedownAction, nil, pagedownAction)
hs.hotkey.bind({}, "pageup", pageupAction, nil, pageupAction)
hs.hotkey.bind({}, "home", homeAction)

hs.hotkey.bind({"shift"}, "home", twitterrificScrollUp)
