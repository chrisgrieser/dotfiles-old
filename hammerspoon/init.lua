-- https://www.hammerspoon.org/go/

--------------------------------------------------------------------------------

hs.window.animationDuration = 0

--------------------------------------------------------------------------------
-- Meta
require("hammerspoon-reloader")
require("utils")
require("console")

-- Base
require("scroll")
require("watchers")
require("system-states")
require("window-management")
require("splits")
require("private")
require("menubar")
require("discord")
require("twitterrific-iina")

-- Spoons
-- https://github.com/Hammerspoon/hammerspoon/blob/master/SPOONS.md
require("vim-mode")

hs.loadSpoon("ColorPicker")
spoon.ColorPicker:start()
spoon.ColorPicker:bindHotkeys({show = { hyper, "z" } })
hs.loadSpoon("KSheet")

--------------------------------------------------------------------------------
notify("Config reloaded")
