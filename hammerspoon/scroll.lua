require("utils")

function scrollDown ()
	hs.eventtap.scrollWheel({0, -scrollAmount}, {})
end

function scrollUp ()
	hs.eventtap.scrollWheel({0, scrollAmount}, {})
end

hotkey({"alt"}, "J", scrollDown, nil, scrollDown)
hotkey({"alt"}, "K", scrollUp, nil, scrollUp)

--------------------------------------------------------------------------------

-- config
quicklookWindow = {w=860, h=860}
scrollAmount = 10

-- positions the cursor that the window is directly scrollable w/o mouse movement
function cursorOverQuicklook ()
	if appIsRunning("qlmanage") then
		local screen = hs.mouse.getCurrentScreen()
		local quicklookWindow = {w=860, h=860}
		local screenCenter = {
			x = (screen:frame().w - quicklookWindow.w) / 2 + 35,
			y = (screen:frame().h - quicklookWindow.h) / 2 + 75,
		}
		hs.mouse.setRelativePosition(screenCenter, screen)
	end
end

function qlmanageAppState (appName, eventType)
	if appName == "qlmanage" then
		if (eventType == hs.application.watcher.launching) then
			-- bla
		elseif (eventType == hs.application.watcher.launching) then
		end
	end
end
quicklookWatcher = hs.application.watcher.new(qlmanageAppState )
quicklookWatcher:start()
