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
require("discord")
require("twitterrific")
--------------------------------------------------------------------------------

hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()

--------------------------------------------------------------------------------
notify("Config reloaded")




