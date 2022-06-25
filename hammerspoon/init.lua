-- https://www.hammerspoon.org/go/

--------------------------------------------------------------------------------

hs.window.animationDuration = 0

--------------------------------------------------------------------------------
-- Meta
require("hammerspoon-reloader")
require("utils")
require("console")

--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- https://github.com/Hammerspoon/hammerspoon/blob/master/SPOONS.md

-- Spoons
require("vim-mode")

hs.loadSpoon("ColorPicker")
spoon.ColorPicker:start()
hotkey(hyper, "P", function () spoon.ColorPicker.toggleColorSamples("Crayons") end)

--------------------------------------------------------------------------------
notify("Config reloaded")
