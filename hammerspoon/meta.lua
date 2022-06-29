require("utils")

-- auto-reload Hammerspoon config when a file changes
reloadDelaySecs = 2
function reloadConfig(files)
	local doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.timer.delayed.new(reloadDelaySecs, function ()
			hs.reload()
		end):start()
	end
end
configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
configWatcher:start()



--------------------------------------------------------------------------------
-- CONSOLE
-- https://www.hammerspoon.org/docs/hs.console.html#getHistory

hs.console.titleVisibility("hidden")
hs.console.toolbar(nil)

hs.console.consoleFont({name = "JetBrainsMonoNL Nerd Font", size = 17})

hs.console.darkMode(false)
hs.console.outputBackgroundColor{ white = 0.92 }

-- copy last command to clipboard
function lc ()
	consoleHistory = hs.console.getHistory()
	lastcommand = consoleHistory[#consoleHistory-1] -- -1 to not copy this itself
	hs.pasteboard.setContents(lastcommand)
	print ("Copied: '"..lastcommand.."'")
end

c = hs.console.clearConsole
