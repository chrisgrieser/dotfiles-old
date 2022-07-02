require("utils")

--  on launch, open OMG Server instead of friends
-- (who needs friends if you have Obsidian?)
function discordLaunchWatcher(appName, eventType)
	if (appName == "Discord") then
		if (eventType == hs.application.watcher.launching) then
			hs.urlevent.openURL("discord://discord.com/channels/686053708261228577/700466324840775831")
		elseif eventType == hs.application.watcher.activated then
			local clipb = hs.pasteboard.getContents()
			if not clipb then return end
			local hasURL = string.match(clipb, '^https?%S+$')
			if (hasURL) then
				hs.pasteboard.setContents("<"..clipb..">")
			end
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
	if not clipb then return end
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

-- Auto-Reconnect Discord RP when activating Obsidian
function obsiDiscordRPreconnect(appName, eventType)
	local activated = eventType == hs.application.watcher.activated
	local isObsi = appName == "Obsidian"
	local discordRunning = appIsRunning("Discord")

	if isObsi and activated and discordRunning then
		hs.urlevent.openURL("obsidian://advanced-uri?vault=Main%20Vault&commandid=obsidian-discordrpc%253Areconnect-discord")
	end
end
obsiAppWatcher = hs.application.watcher.new(obsiDiscordRPreconnect)
obsiAppWatcher:start()

