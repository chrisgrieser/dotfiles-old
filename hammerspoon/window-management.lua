-- https://www.hammerspoon.org/go/
-------------------------------------

Hyperkey = {"cmd", "alt", "ctrl", "shift"}

function moveAndResize(direction)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h

	if (direction == "left") then
		f.w = max.w / 2
	elseif (direction == "right") then
		f.w = max.w / 2
		f.x = max.x + (max.w / 2)
	elseif (direction == "up") then
		f.h = max.h / 2
	elseif (direction == "down") then
		f.h = max.h / 2
		f.y = max.y + (max.h / 2)
	elseif (direction == "pseudo-maximized") then
		f.w = max.w * 0.815
	end
	win:setFrame(f)
end

hs.hotkey.bind(Hyperkey, "Up", function () moveAndResize("up") end)
hs.hotkey.bind(Hyperkey, "Down", function () moveAndResize("down") end)
hs.hotkey.bind(Hyperkey, "Right", function () moveAndResize("right") end)
hs.hotkey.bind(Hyperkey, "Left", function () moveAndResize("left") end)
hs.hotkey.bind(Hyperkey, "Space", function () moveAndResize("maximized") end)
hs.hotkey.bind({"ctrl"}, "Space", function () moveAndResize("pseudo-maximized") end)

--------------------------------------------------------------------------------

function vsplit()
	local win = hs.window.focusedWindow()
	local screen = win:screen()
	local max = screen:frame()

	-- left side
	local f1 = win:frame()
	f1.x = max.x
	f1.y = max.y
	f1.w = max.w / 2
	f1.h = max.h

	-- right side
	local f2 = win:frame()
	f2.x = max.x + (max.w / 2)
	f2.y = max.y
	f2.w = max.w / 2
	f2.h = max.h
end
