require("utils")

function twitterrificScrollUp ()
	twitterrificScrolling = true

	-- needs activation, cause sending to app in background doesn't work w/ cmd
	local previousApp = hs.application.frontmostApplication():name()

	local twitterrific = hs.application("Twitterrific")
	twitterrific:activate()
	if #(twitterrific:allWindows()) == 1 then
		keystroke({"cmd"}, "1") -- go to home window
	else
		local homeWindow = twitterrific:getWindow("@pseudo_meta - Home")
		if homeWindow then
			homeWindow:focus()
		else
			twitterrific.allWindows()[1]:focus()
			keystroke({"cmd"}, "1") -- go to home window
		end
	end

	keystroke({"cmd"}, "k") -- mark all as red
	keystroke({"cmd"}, "j") -- scroll up
	keystroke({"cmd"}, "1") -- scroll up failsafe
	keystroke({}, "down") -- enable j/k movement

	hs.application(previousApp):activate()

	twitterrificScrolling = false
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
-- Hotkeys
hotkey({}, "pagedown", pagedownAction, nil, pagedownAction)
hotkey({}, "pageup", pageupAction, nil, pageupAction)
hotkey({}, "home", homeAction)

	hotkey({"shift"}, "home", twitterrificScrollUp)
	--------------------------------------------------------------------------------
	-- raise all windows on activation,
	-- open both windows on launch
	function twitterificAppActivated(appName, eventType, appObject)
		if twitterrificScrolling then return end
		if (appName == "Twitterrific") then
			if (eventType == hs.application.watcher.launching) then
				runDelayed(1, function ()
					twitterrific = hs.application("Twitterrific")
					-- has to be done via keystroke, since headless
					keystroke({"cmd"}, "T", twitterrific)
					keystroke({"cmd"}, "5", twitterrific)
					keystroke({}, "down", twitterrific)
					keystroke({}, "return", twitterrific)
				end)

			elseif (eventType == hs.application.watcher.activated) then
				-- this doesn't work in headless mode
				-- appObject:selectMenuItem({"Window", "Bring All to Front"})
				appObject:getWindow("@pseudo_meta - List"):raise()
				appObject:getWindow("@pseudo_meta - Home"):focus()
			end
		end
	end
	twitterificAppWatcher = hs.application.watcher.new(twitterificAppActivated)
	-- if isAtOffice() then twitterificAppWatcher:start() end
	twitterrificScrolling = false

