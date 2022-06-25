require("utils")

-- auto-reload Hammerspoon config when a file changes
reloadDelaySecs = 5
function reloadConfig(files)
	local doReload = false
	for _,file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		-- only reload after 5 secs
		hs.timer.delayed.new(reloadDelaySecs, function ()
			hs.reload()
		end):start()
	end
end
configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
configWatcher:start()

