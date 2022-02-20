#!/usr/bin/env osascript
tell application id "com.runningwithcrayons.Alfred"
	run trigger "backup-obsidian" in workflow "de.chris-grieser.shimmering-obsidian" with argument ""
	run trigger "backup-alfred-prefs" in workflow "de.chris-grieser.alfred-tweaks" with argument ""
	run trigger "BibTeX Library Backup" in workflow "de.chris-grieser.bibdesk" with argument ""
	run trigger "backup-sublime-prefs" in workflow "de.chris-grieser.sublime" with argument ""
end tell

-- log
