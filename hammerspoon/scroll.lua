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
quicklookWindow = {w=860, h=860}

-- positions the cursor that the window is directly scrollable w/o mouse movement
-- and move away when done
qlscrollDown = hotkey({}, "j", scrollDown, nil, scrollDown)
qlscrollUp = hotkey({}, "k", scrollUp, nil, scrollUp)
qlscrollDown:disable()
qlscrollUp:disable()

function qlmanageAppState (appName, eventType)
	if appName == "qlmanage" then
		local screen = hs.mouse.getCurrentScreen()
		local pos

		if (eventType == hs.application.watcher.launching) then
			pos = {
				x = (screen:frame().w - quicklookWindow.w) / 2 + 35,
				y = (screen:frame().h - quicklookWindow.h) / 2 + 75,
			}
			qlscrollDown:enable()
			qlscrollUp:enable()
		elseif (eventType == hs.application.watcher.terminated) then
			pos = {
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
