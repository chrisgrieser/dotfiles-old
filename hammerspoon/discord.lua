--  on launch, open OMG Server instead of friends
-- (who needs friends if you have Obsidian?)
function discordLaunchWatcher(appName, eventType)
	if (eventType == hs.application.watcher.launching) then
		if (appName == "Discord") then
			hs.urlevent.openURL("discord://discord.com/channels/686053708261228577/700466324840775831")
		end
	end
end
discordAppWatcher = hs.application.watcher.new(discordLaunchWatcher)
discordAppWatcher:start()

-- Eliminate Discord URL previews
-- when Discord is focused, enclose URL in clipboard with <>
discordAppFilter = hs.window.filter.new("Discord")
discordAppFilter:subscribe(hs.window.filter.windowFocused, function()
	local clipb = hs.pasteboard.getContents()
	local hasURL = string.match(clipb, '^https?%S+$')
	if (hasURL) then
		hs.pasteboard.setContents("<"..clipb..">")
	end
end)
-- when Discord is unfocused, removes <> from URL in clipboard
discordAppFilter:subscribe(hs.window.filter.windowUnfocused, function()
	local clipb = hs.pasteboard.getContents()
	local hasEnclosedURL = string.match(clipb, '^<https?%S+>$')
	if (hasEnclosedURL) then
		clipb = clipb:sub(2, -2) -- remove first & last character
		hs.pasteboard.setContents(clipb)
	end
end)
