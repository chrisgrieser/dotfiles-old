#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
subl ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/obsidian.vimrc"
subl ~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Sublime User Folder/.neovintageousrc"

sleep 1
subl --command "set_layout {\"cols\": [0.0, 0.5, 1.0], \"rows\": [0.0, 1.0], \"cells\": [[0, 0, 1, 1], [1, 0, 2, 1]]  }"
# subl --command "focus_neighboring_group"
subl --command "move_to_neighboring_group"
