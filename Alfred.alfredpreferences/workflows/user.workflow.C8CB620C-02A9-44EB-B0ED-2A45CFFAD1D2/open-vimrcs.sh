#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
subl --project ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Sublime User Folder/vimrcs.sublime-project"

osascript -e "tell application \"System Events\" to keystroke space using {command down, option down, shift down, control down}"
