--  on launch, open OMG Server instead of friends
-- (who needs friends if you have Obsidian?)
function discordWatcher(appName, eventType)
	if (eventType == hs.application.watcher.launching) then
		if (appName == "Discord") then
			hs.urlevent.openURL("discord://discord.com/channels/686053708261228577/700466324840775831")
		end
	end
end
discordAppWatcher = hs.application.watcher.new(discordWatcher)
discordAppWatcher:start()

discordURLFixer.enable_hotkey_matching_for_app = function(app_names, hotkey)
	app_names = type(app_names) =="table" and app_names or {app_names}
	local filter = hs.window.filter.new(app_names)
	filter:subscribe(hs.window.windowFocused, function()
	                 hotkey:enable()
	              end)
	filter:subscribe(hs.window.windowUnfocused, function()
	                 hotkey:disable()
	              end)
end

-- when Discord activates and the clipboard contains an URL,
-- it will automatically be enclosed in <> to avoid annoying previews
-- function discordURLFixer(appName, eventType)
-- 	if (eventType == hs.application.watcher.activated) then
-- 		if (appName == "Discord") then
-- 			local clipb = hs.pasteboard.getContents()
-- 			local hasURL = string.match(clipb, '^https?%S+$')
-- 			if (hasURL) then
-- 				hs.pasteboard.setContents("<" .. clipb .. ">")
-- 			end
-- 		end
-- 	end
-- end
-- discordClipboardWatcher = hs.application.watcher.new(discordURLFixer)
-- discordClipboardWatcher:start()
