-- https://www.hammerspoon.org/go/

--------------------------------------------------------------------------------

hs.window.animationDuration = 0
hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()

--------------------------------------------------------------------------------
require("utils")
require("watchers")
require("window-management")
require("splits")
require("private")
require("menubar")
require("discord")
require("twitterrific")
require("input-methods")

--------------------------------------------------------------------------------
notify("Config reloaded")




