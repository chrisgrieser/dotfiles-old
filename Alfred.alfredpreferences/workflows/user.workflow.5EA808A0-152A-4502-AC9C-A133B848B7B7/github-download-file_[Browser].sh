#!/bin/zsh
# shellcheck disable=SC2154

working_folder="${working_folder/#\~/$HOME}"
cd "$working_folder" || return
osascript -e "tell application \"Brave Browser\" to return URL of active tab of front window" \
      | sed -e "s/github/raw.githubusercontent/" \
      | sed -e "s/blob\///" \
      | xargs curl -O

open "$working_folder"
