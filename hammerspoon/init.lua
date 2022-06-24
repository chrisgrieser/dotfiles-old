-- https://www.hammerspoon.org/go/

--------------------------------------------------------------------------------

hs.window.animationDuration = 0
hs.window.setFrameCorrectness = true

--------------------------------------------------------------------------------
require("utils")
require("watchers")
require("window-management")
require("private")
require("menubar")
require("app-specific")
--------------------------------------------------------------------------------

hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()
-- spoon.RoundedCorners:stop()

--------------------------------------------------------------------------------
notify("Config reloaded")




