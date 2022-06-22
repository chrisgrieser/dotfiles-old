-- https://www.hammerspoon.org/go/
-------------------------------------

require("watchers")
require("window-management")

--------------------------------------------------------------------------------
hs.window.animationDuration = 0

--------------------------------------------------------------------------------

-- auto-reload config when file changes
function reloadConfig(files)
	doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
configWatcher:start()
hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()




