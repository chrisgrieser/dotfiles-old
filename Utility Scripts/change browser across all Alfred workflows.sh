#!/bin/zsh

cd "$ZSH_DOTFILE_LOCATION/.." || return 1

# check
fd "_\[Browser\]"
fd "_\[Browser\]" | xargs -I{} grep "Vivaldi" "{}"
fd "_\[Browser-Path\]" | xargs -I{} grep "Vivaldi" "{}"

# replace (insert Browsers here)
fd "_\[Browser\]" | xargs -I{} sed -i '.bak' 's/Vivaldi/Brave Browser/g' "{}"

# replace (insert Browsers PATHS here)
fd "_\[Browser-Path\]" | xargs -I{} sed -i '.bak' 's/Vivaldi/Brave Software\/Brave Browser/g' "{}"

# remove backups
fd ".*\.bak" | xargs -I{} mv "{}" ~./Trash
