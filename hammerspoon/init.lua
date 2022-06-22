-- https://www.hammerspoon.org/go/
-------------------------------------

Hyperkey = {"cmd", "alt", "ctrl", "shift"}
function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

--------------------------------------------------------------------------------

hs.window.animationDuration = 0

--------------------------------------------------------------------------------

require("watchers")
require("window-management")
require("private")
require("menubar")

--------------------------------------------------------------------------------

notify("Config reloaded")




