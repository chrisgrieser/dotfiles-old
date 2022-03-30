#!/bin/zsh
# using full path makes this work even if `subl` hasn't been added to PATH
sublcli="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"

query="$*"

"$sublcli" "$query"

# if directory, then show sidebar
# and hide tabbar
if [[ -d "$query" ]] ; then
	"$sublcli" --command toggle_tabs
	"$sublcli" --command toggle_side_bar
fi
