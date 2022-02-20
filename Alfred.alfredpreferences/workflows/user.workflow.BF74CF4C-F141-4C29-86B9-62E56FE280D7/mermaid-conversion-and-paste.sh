#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

mm_code="$*"
# remove code fence
mm_code=`echo "$mm_code" | grep -v '\`\`\`'`

mkdir -p "$alfred_workflow_cache"
temp="$alfred_workflow_cache"/temp.png

echo "$mm_code" | mmdc --scale $scale_factor -o "$temp"
osascript -e 'set the clipboard to POSIX file ("'"$temp"'")'
osascript -e 'tell application "System Events" to keystroke "v" using {command down}'
