require("menubar")
require("utils")
require("window-management")

function systemWake (eventType)
	if (eventType == hs.caffeinate.watcher.screensDidWake) then

		reloadAllMenubarItems()
		homeWindowLayout()
		hs.shortcuts.run("Send Reminders due today to Drafts")
		-- hs.brightness.set(50)

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
wakeWatcher = hs.caffeinate.watcher.new(systemWake)
wakeWatcher:start()

hs.timer.doAt("06:10", "01d", function()
	systemWake()
	hs.execute("echo Hammer-Morning\\ $(date '+%Y-%m-%d %H:%M') >> '/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/Cron Jobs/some.log'")
end, false)
