-- https://www.hammerspoon.org/go/
-------------------------------------

function moveAndResize(direction)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h

	f.w = max.w / 2
	win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "U", function () moveAndResize("up") end)
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "down", moveAndResize("down"))
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "right", moveAndResize("right"))
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "left", moveAndResize("left"))

