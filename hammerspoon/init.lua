-- https://www.hammerspoon.org/go/

--------------------------------------------------------------------------------

hs.window.animationDuration = 0

--------------------------------------------------------------------------------
require("utils")
require("watchers")
require("window-management")
require("splits")
require("private")
require("menubar")
require("misc")
--------------------------------------------------------------------------------

hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()
-- spoon.RoundedCorners:stop()

--------------------------------------------------------------------------------
notify("Config reloaded")




