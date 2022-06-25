-- https://www.hammerspoon.org/docs/hs.console.html#getHistory
--------------------------------------------------------------------------------

hs.console.titleVisibility("hidden")
hs.console.toolbar(nil)

hs.console.consoleFont({name = "JetBrainsMonoNL Nerd Font", size = 19})

hs.console.darkMode(false)
hs.console.outputBackgroundColor{ white = 0.92 }
-- hs.console.consoleCommandColor{ white = 1 }
-- hs.console.consoleResultColor{ white = 0.8 }
-- hs.console.consolePrintColor{ white = 0.7 }

-- copy last command to clipboard
function lc ()
	consoleHistory = hs.console.getHistory()
	lastcommand = consoleHistory[#consoleHistory-1] -- -1 to not copy the last command itself
	hs.pasteboard.setContents(lastcommand)
	print ("Copied: '"..lastcommand.."'")
end
