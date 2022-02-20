#!/bin/zsh

DayOfWeek=$(date '+%A')
if [[ $DayOfWeek != "Sunday" ]] ; then
	exit 0
fi


last_backup=$(cat ~'/Library/Application Support/Alfred/Workflow Data/de.chris-grieser.backup-utility/backup.log' | tail -n 1)
osascript -e 'tell application "Drafts" to make new draft with properties {content: "# Backup\n'"$last_backup"'", tags: {"to do"}}'

