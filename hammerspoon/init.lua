-- https://www.hammerspoon.org/go/

--------------------------------------------------------------------------------

hs.window.animationDuration = 0
hs.window.highlight.ui.flashDuration=0.3

--------------------------------------------------------------------------------
-- Hammerspoon itself & Helper Utilities
require("meta")
require("utils")

--------------------------------------------------------------------------------

-- Base
require("scroll-and-cursor")
require("menubar")
require("system-states")
require("window-management")
require("filesystem-watchers")

-- app-specific
require("watchers")
require("discord")
require("twitterrific-iina")

--------------------------------------------------------------------------------
-- https://github.com/Hammerspoon/hammerspoon/blob/master/SPOONS.md

-- Spoons
require("vim-mode")

--------------------------------------------------------------------------------
notify("Config reloaded")
