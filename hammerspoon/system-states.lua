function systemWakeWatcher (eventType)
	if (eventType == hs.caffeinate.watcher.screensDidWake) then

		reloadAllMenubarItems()
		homeWindowLayout()
		hs.shortcuts.run("Send Reminders due today to Drafts")

		-- run darkmode toggle between 6:00 and 18:00
		local timeHours = hs.timer.localTime() / 60 / 60
		if timeHours < 18 and timeHours > 6 then
			hs.applescript ([[
				tell application "System Events"
					tell appearance preferences
						if (dark mode is true) then tell application id "com.runningwithcrayons.Alfred" to run trigger "toggle-dark-mode" in workflow "de.chris-grieser.dark-mode-toggle"
					end tell
				end tell
			]])
		end

	end
end
wakeWatcher = hs.caffeinate.watcher.new(systemWakeWatcher)
wakeWatcher:start()
