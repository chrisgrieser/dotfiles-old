export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
folder="$HOME/Video/Downloaded"
icons_path="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/Download Folder"
itemCount=$(ls "$folder" | wc -l)
itemCount=$((itemCount-1)) # reduced by one to account for the "?Icon" file in the folder

# cache necessary to rpevent recursion of icon change triggering pathwatcher again
cache_location="/Library/Caches/dlFolderLastChange"
touch "$cache_location" # to ensure cache existence on new machines
last_change=$(cat "$cache_location")

# using test instead of square brackets cause lua
if test $itemCount -gt 0 && test $last_change != "badge" ; then
	fileicon set "$folder" "$icons_path/with Badge.icns"
	echo "badge" > "$cache_location"
	killall Dock
elif test $itemCount -eq 0 && test $last_change == "badge" ; then
	fileicon set "$folder" "$icons_path/without Badge.icns"
	echo "" > "$cache_location"
	killall Dock
fi
