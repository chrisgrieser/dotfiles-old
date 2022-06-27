require("utils")

function twitterrificScrollUp ()
	-- needs activation, cause sending to app in bg does not work with cmd key
	local previousApp = hs.application.frontmostApplication():name()

	hs.application("Twitterrific"):activate()
	keystroke({"cmd"}, "k") -- mark all as red
	keystroke({"cmd"}, "j") -- scroll up
	keystroke({"cmd"}, "1") -- scroll up failsafe
	keystroke({}, "down") -- enable j/k movement

	hs.application(previousApp):activate()
end

function pagedownAction ()
	if appIsRunning("IINA") then
		keystroke({}, "right", 1, hs.application("IINA"))
	else
		keystroke({}, "down", 1, hs.application("Twitterrific"))
	end
end
function pageupAction ()
	if appIsRunning("IINA") then
		keystroke({}, "left", 1, hs.application("IINA"))
	else
		keystroke({}, "up", 1, hs.application("Twitterrific"))
	end
end
function homeAction ()
	if appIsRunning("IINA") then
		keystroke({}, "Space", 1, hs.application("IINA"))
	else
		hs.application("Twitterrific"):activate()
	end
end

-- IINA: Full Screen when on projector
function iinaLaunch(appName, eventType, appObject)
	if (eventType == hs.application.watcher.launched) then
		if (appName == "IINA") then
			local isProjector = hs.screen.primaryScreen():name() == "ViewSonic PJ"
			if isProjector then
				-- going full screen apparently needs a small delay
				hs.timer.delayed.new(1, function()
					appObject:selectMenuItem({"Video", "Enter Full Screen"})
				end):start()
			end
		end
	end
end
iinaAppLauncher = hs.application.watcher.new(iinaLaunch)
iinaAppLauncher:start()

--------------------------------------------------------------------------------

hotkey({}, "pagedown", pagedownAction, nil, pagedownAction)
hotkey({}, "pageup", pageupAction, nil, pageupAction)
hotkey({}, "home", homeAction)

hotkey({"shift"}, "home", twitterrificScrollUp)
