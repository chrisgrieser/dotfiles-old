#!/usr/bin/env zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

STATUS=$(espanso status)

if [[ "$STATUS" =~ "not" ]]; then
	opan -a "Espanso"
	sleep 0.5
	espanso start
	MSG="on"
else
	espanso stop
	MSG="off"
fi

echo "Espanso: $MSG"
