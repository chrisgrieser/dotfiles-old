#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

query="$*"

subl "$query"

# if directory, then show sidebar
# and hide tabbar
if [[ -d "$query" ]] ; then
	subl --command toggle_tabs
	subl --command toggle_side_bar
fi
