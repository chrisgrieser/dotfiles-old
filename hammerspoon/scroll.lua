require("utils")

function cursorOverQuicklook ()
	if appIsRunning("qlmanage") then
		hs.mouse.setRelativePosition()
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
