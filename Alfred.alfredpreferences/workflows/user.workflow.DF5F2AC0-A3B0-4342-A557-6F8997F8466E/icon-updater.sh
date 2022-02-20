#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
icon_update_script=~`echo -n $icon_update_script | sed -e "s/~//"`

# read file until the stopstring, then run it
sed -n "1,/# stopstring-for-alfred/p" $icon_update_script | zsh