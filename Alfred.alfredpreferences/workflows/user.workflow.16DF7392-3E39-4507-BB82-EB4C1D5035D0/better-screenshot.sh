#!/bin/zsh
temp_image="$alfred_workflow_cache""/Screenshot ""$(date '+%Y-%m-%d %H.%M.%S')"".png"
mkdir -p "$alfred_workflow_cache"

screencapture -i "$temp_image"

# existence check allows for the canceling of a screenshot
if [[ -e "$temp_image" ]] ; then
	osascript -e "set the clipboard to POSIX file \"$temp_image\""
	echo "image done"
fi
