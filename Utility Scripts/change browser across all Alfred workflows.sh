#!/bin/zsh

cd "$ZSH_DOTFILE_LOCATION/.." || return 1

# replace (insert Browsers here)
fd "_\[Browser\]" | xargs -I{} sed -i '.bak' 's/Brave Browser/Vivaldi/g' "{}"
sed -i '.bak' 's/Brave Browser/Vivaldi/g' .finicky.js

# replace (insert Browsers PATHS here)
fd "_\[Browser-Path\]" | xargs -I{} sed -i '.bak' 's/Brave Software\/Brave Browser/Vivaldi/g' "{}"

# remove backups
fd ".*\.bak" | xargs -I{} mv "{}" ~/.Trash
