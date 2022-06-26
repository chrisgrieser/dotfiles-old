require("utils")

--------------------------------------------------------------------------------
-- global pageup/dwon keys
-- have to be done here, since when send from Karabiner, gets caught by the
-- pagedown/up listener from Hammerspoon in `twitterific-iina.lua`

function scrollDown ()
	if frontapp() == "alacritty" or frontapp() == "Terminal" then
		keystroke ({"shift"}, "pagedown")
		notify("test")
	else
		keystroke ({}, "pagedown")
	end
end
function scrollUp ()
	if frontapp() == "alacritty" or frontapp() == "Terminal" then
		keystroke ({"shift"}, "pageup")
	else
		keystroke ({}, "pageup")
	end
end

hotkey({"alt"}, "J", scrollDown, nil, scrollDown)
hotkey({"alt"}, "K", scrollUp, nil, scrollUp)

--------------------------------------------------------------------------------
-- quicklook window scrolling
-- positions the cursor that the window is directly scrollable w/o mouse movement
-- and enables j/k for scrolling

quicklookWindow = {w=806, h=806} -- dependent on the setting of the Peek-App
scrollAmount = 10
function qlScrollWheelDown ()
	hs.eventtap.scrollWheel({0, -scrollAmount}, {})
end
function qlScrollWheelUp ()
	hs.eventtap.scrollWheel({0, scrollAmount}, {})
end
qlscrollDown = hotkey({}, "j", qlScrollWheelDown, nil, qlScrollWheelDown)
qlscrollUp = hotkey({}, "k", qlScrollWheelUp, nil, qlScrollWheelUp)
qlscrollDown:disable()
qlscrollUp:disable()
function qlmanageAppState (appName, eventType)
	if appName == "qlmanage" then
		local screen = hs.mouse.getCurrentScreen()
		local pos

		-- can't use window-filter, since the quicklook preview isn't a window
		if (eventType == hs.application.watcher.launching) then
			pos = { -- move to top left of quicklook window for scrolling
				x = (screen:frame().w - quicklookWindow.w) / 2 + 10,
				y = (screen:frame().h - quicklookWindow.h) / 2 + 60,
			}
			qlscrollDown:enable()
			qlscrollUp:enable()
		elseif (eventType == hs.application.watcher.terminated) then
			pos = { -- move to the bottom right of screen
				x = screen:frame().w,
				y = screen:frame().h * 0.75,
			}
			qlscrollDown:disable()
			qlscrollUp:disable()
		end

		hs.mouse.setRelativePosition(pos, screen)
	end
end
quicklookWatcher = hs.application.watcher.new(qlmanageAppState )
quicklookWatcher:start()
