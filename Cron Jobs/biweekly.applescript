#!/usr/bin/env osascript
tell application id "com.runningwithcrayons.Alfred"
	run trigger "backup-obsidian" in workflow "de.chris-grieser.shimmering-obsidian" with argument "no sound"
	run trigger "backup-alfred-prefs" in workflow "de.chris-grieser.alfred-tweaks" with argument "no sound"
	run trigger "BibTeX Library Backup" in workflow "de.chris-grieser.alfred-bibtex-citation-picker"
	run trigger "re-index-doc-search" in workflow "de.chris-grieser.shimmering-obsidian"
end tell

-- upload potential changes documentation update
set homefolder to (POSIX path of (path to home folder as string))
do shell script "cd " & homefolder & "\"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Alfred.alfredpreferences/workflows/user.workflow.D02FCDA1-EA32-4486-B5A6-09B42C44677C\"
git add -A
git commit -m 'documentation search update'
git push"

