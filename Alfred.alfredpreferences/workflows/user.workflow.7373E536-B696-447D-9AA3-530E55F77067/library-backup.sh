#!/bin/zsh

timestamp=$(date '+%Y-%m-%d_%H-%M')
library_path="${library_path/#\~/$HOME}"
library_name="$(basename "$library_path")"
backup_destination="${backup_destination/#\~/$HOME}""$timestamp"_"$library_name"

# copy
cp "$library_path" "$backup_destination"

# restrict number of backups
actual_number=$((max_number_of_bkps + 1))
cd $backup_destination
ls -t | tail -n +$actual_number | tr '\n' '\0' | xargs -0 rm

echo -n "Library Backup finished."
