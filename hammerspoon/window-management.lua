-- https://www.hammerspoon.org/go/
-------------------------------------



function moveAndResize (direction)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h

	if (direction == "left") then

	end
	win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Up", moveAndResize("up"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Down", moveAndResize("down"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Right", moveAndResize("right"))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Left", moveAndResize("left"))

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
