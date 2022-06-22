# DOWNLOAD FOLDER BADGE
# ----------------------------------------------------
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
folder=~"/Video/Downloaded"
icons_path=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/Download Folder/"
itemCount=$(ls "$folder" | wc -l)
itemCount=$((itemCount-1)) # reduced by one to account for the "?Icon" file in the folder

# badge
if [[ $itemCount -gt 0 ]] ; then
	fileicon set "$folder" "${icons_path}with Badge.icns"
else
	fileicon set "$folder" "${icons_path}without Badge.icns"
fi

killall Dock
