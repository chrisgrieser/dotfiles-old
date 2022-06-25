require("utils")

function scrollVertically (distance)
	hs.eventtap.scrollWheel({0, distance}, {})
end

scrollAmount = 10

function scrollDown ()
	scrollVertically(-scrollAmount)
end
function scrollUp ()
	scrollVertically(scrollAmount)
end
--------------------------------------------------------------------------------
-- global scroll hotkeys

hotkey({"alt"}, "J", scrollDown, nil, scrollDown)
hotkey({"alt"}, "K", scrollUp, nil, scrollUp)

--------------------------------------------------------------------------------
-- quicklook window scrolling
-- positions the cursor that the window is directly scrollable w/o mouse movement
-- and enables j/k for scrolling

quicklookWindow = {w=806, h=806} -- dependent on the setting of the Peek-App
qlscrollDown = hotkey({}, "j", scrollDown, nil, scrollDown)
qlscrollUp = hotkey({}, "k", scrollUp, nil, scrollUp)
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
