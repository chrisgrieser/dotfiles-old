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

-- BRAVE Bookmarks synced to Chrome Bookmarks (needed for Alfred)
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

-- HOT CORNER Use "Quick Note" as Pseudo Hot Corner Action
-- to trigger something else instead
function hotcornerWatcher(appName, eventType)
	if (eventType == hs.application.watcher.activated) then
		if (appName == "Notes") then
			hs.application("Notes"):kill9()
			hs.shortcuts.run("Keyboard on-screen")
		end
	end
end
hotcornerEmulation = hs.application.watcher.new(hotcornerWatcher)
hotcornerEmulation:start()

-- Move Scans to File Hub
scanFolder = os.getenv("HOME").."/Library/Mobile Documents/iCloud~com~geniussoftware~GeniusScan/Documents/"
targetFolder = os.getenv("HOME").."/Library/Mobile Documents/com~apple~CloudDocs/File Hub/"
function scanFolderMove()
	hs.execute("mv '"..scanFolder.."'/* '"..targetFolder.."'")
end
scanFolderWatcher = hs.pathwatcher.new(scanFolder, scanFolderMove)
scanFolderWatcher:start()

-- Cursor Hiding
-- when Brave or Alacritty activated, hide cursor
function jHidingCursor()
	hs.eventtap.keyStroke({}, "j", 1, hs.application("Brave Browser"))
	local screen = hs.mouse.getCurrentScreen()
	local pos = {
		x = screen:frame().w,
		y = screen:frame().h * 0.75,
	}
	hs.mouse.setRelativePosition(pos, screen)
	notify("active")
end
jHidesCursor = hotkey({},"j", jHidingCursor, nil, jHidingCursor)

jHidesCursor:disable()
-- kHidesCursor:disable()
function jkWatcher(appName, eventType)
	if (eventType == hs.application.watcher.activated) then
		if (appName:lower() == "alacritty") then
			local screen = hs.mouse.getCurrentScreen()
			local pos = {
				x = screen:frame().w,
				y = screen:frame().h * 0.75,
			}
			hs.mouse.setRelativePosition(pos, screen)
		elseif (appName == "Brave Browser") then
			jHidesCursor:enable()
			notify("switched to brave")
			-- hs.timer.delayed.new(1, function () jHidesCursor:disable() end):start()
		end
	end
end
jk_watcher = hs.application.watcher.new(jkWatcher)
jk_watcher:start()
