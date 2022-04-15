#!/usr/bin/env osascript
tell application id "com.runningwithcrayons.Alfred"
	run trigger "backup-obsidian" in workflow "de.chris-grieser.shimmering-obsidian" with argument "no sound"
	run trigger "backup-alfred-prefs" in workflow "de.chris-grieser.alfred-tweaks" with argument "no sound"
	run trigger "BibTeX Library Backup" in workflow "de.chris-grieser.alfred-bibtex-citation-picker"
	run trigger "re-index-doc-search" in workflow "de.chris-grieser.shimmering-obsidian"
end tell

