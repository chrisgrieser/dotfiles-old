#!/bin/zsh

cd "$ZSH_DOTFILE_LOCATION/.." || return 1

# check
fd "_\[Browser\]"
fd "_\[Browser\]" | xargs -I{} grep "\"Vivaldi\"" "{}"

# replace (insert Browsers here)
fd "_\[Browser\]" | xargs -I{} sed -i '' 's/"Vivaldi"/"Chromium"/g' "{}"
