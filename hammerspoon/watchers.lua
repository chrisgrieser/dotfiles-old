require("utils")

-- FINDER: Bring all windows forward & hide sidebar when activated
function finderWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.activated) then
		if (appName == "Finder") then
			appObject:selectMenuItem({"Window", "Bring All to Front"})
			appObject:selectMenuItem({"View", "Hide Sidebar"})
		end
	end
end
finderAppWatcher = hs.application.watcher.new(finderWatcher)
finderAppWatcher:start()

-- DISCORD: on launch, open OMG Server instead of friends
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

-- DISCORD: pasteboard fix for URLs
-- when Discord activites and the clipboard contains an URL
-- it will be enclosed in <> to avoid annoying previews
function discordURLFixer(appName, eventType)
	if (eventType == hs.application.watcher.activated) then
		if (appName == "Discord") then
			local clipb = hs.pasteboard.getContents()
			local hasURL = string.match(clipb, '^https?%S+$')
			if (hasURL) then
				hs.pasteboard.setContents("<" .. hs.pasteboard.getContents() .. ">")
			end
		end
	end
end
discordClipboardWatcher = hs.application.watcher.new(discordURLFixer)
discordClipboardWatcher:start()

-- HIGHLIGHTS: Sync Dark & Light Mode
function highlightsWatcher(appName, eventType)
	if (eventType == hs.application.watcher.launching) then
		if (appName == "Highlights") then
			hs.applescript([[
				tell application "System Events"
					tell appearance preferences to set isDark to dark mode
					if (isDark is false) then set targetView to "Default"
					if (isDark is true) then set targetView to "Night"
					delay 0.5

					tell process "Highlights"
						set frontmost to true
						click menu item targetView of menu of menu item "PDF Appearance" of menu "View" of menu bar 1
					end tell
				end tell
			]])
		end
	end
end
highlightsAppWatcher = hs.application.watcher.new(highlightsWatcher)
highlightsAppWatcher:start()

-- PROJECTOR: Dim brightness when projector is connected
function displayCountWatcher()
	local isProjector = hs.screen.primaryScreen():name() == "ViewSonic PJ"
	local isIMacAtHome = hs.screen.primaryScreen():name() == "Built-in Retina Display"

	if (isProjector) then
		-- "hs.brightness.set" does not work when second display is mirrored
		-- therefore using Shortcuts instead
		hs.shortcuts.run('Zero Brightness')
		hs.application.open("YouTube")
		hs.application("Drafts"):kill9()
		hs.application("Slack"):kill9()
		hs.application("Discord"):kill9()
		hs.application("Mimestream"):kill9()
	elseif (isIMacAtHome) then
		hs.brightness.set(50)
		homeWindowLayout()
	end
end
displayWatcher = hs.screen.watcher.new(displayCountWatcher)
displayWatcher:start()

-- Brave Bookmarks synced to Chrome Bookmarks (needed for Alfred)
function bookmarkSync()
	hs.execute([[
		BROWSER="BraveSoftware/Brave-Browser"
		mkdir -p "$HOME/Library/Application Support/Google/Chrome/Default"
		cp "$HOME/Library/Application Support/$BROWSER/Default/Bookmarks" "$HOME/Library/Application Support/Google/Chrome/Default/Bookmarks"
		cp "$HOME/Library/Application Support/$BROWSER/Local State" "$HOME/Library/Application Support/Google/Chrome/Local State"
	]])
	notify("Bookmarks synced")
end
BraveBookmarks = os.getenv("HOME") .. "/Library/Application Support/BraveSoftware/Brave-Browser/Default/Bookmarks"
bookmarkWatcher = hs.pathwatcher.new(BraveBookmarks, bookmarkSync)
bookmarkWatcher:start()

-- Download Folder Badge
function downloadFolderBadge ()
	-- requires "fileicon" being installed
	hs.execute([[
		export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
		folder="$HOME/Video/Downloaded"
		icons_path="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/Download Folder"
		itemCount=$(ls "$folder" | wc -l)
		itemCount=$((itemCount-1)) # reduced by one to account for the "?Icon" file in the folder

		# cache necessary to rpevent recursion of icon change triggering pathwatcher again
		cache_location="/Library/Caches/dlFolderLastChange"
		if test ! -e "$cache_location" ; then
			if test $itemCount -gt 0 ; then
				echo "badge" > "$cache_location"
			else
				touch "$cache_location"
			fi
		fi
		last_change=$(cat "$cache_location")

		# using test instead of square brackets cause lua
		if test $itemCount -gt 0 && test -z "$last_change" ; then
			fileicon set "$folder" "$icons_path/with Badge.icns"
			echo "badge" > "$cache_location"
			killall Dock
		elif test $itemCount -eq 0 && test -n "$last_change" ; then
			fileicon set "$folder" "$icons_path/without Badge.icns"
			echo "" > "$cache_location"
			killall Dock
		fi
	]])
end
downloadFolderWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Video/Downloaded", downloadFolderBadge)
downloadFolderWatcher:start()

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "W", downloadFolderBadge)

-- auto-reload Hammerspoon config when a file changes
function reloadConfig(files)
	local doReload = false
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
