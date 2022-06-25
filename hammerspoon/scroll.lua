require("utils")

function cursorOverQuicklook ()
	if appIsRunning("qlmanage") then
		local screen = hs.mouse.getCurrentScreen()
		local quicklookWinW = 860
		local quicklookWinH = 860
		local screenCenter = {
			x = (screen:frame().w - quicklookWinW) / 2 + 50,
			y = (screen:frame().g - quicklookWinH) / 2 + 20,
		}
		hs.mouse.setRelativePosition(screenCenter, screen)
	end
end

function scrollDown ()
	cursorOverQuicklook()
	for i=1,10 do
		hs.eventtap.scrollWheel({0, -1}, {})
	end
end

function scrollUp ()
	cursorOverQuicklook()
	for i=1,10 do
		hs.eventtap.scrollWheel({0, 1}, {})
	end
end

hotkey({"alt"}, "J", scrollDown, nil, scrollDown)
hotkey({"alt"}, "K", scrollUp, nil, scrollUp)
