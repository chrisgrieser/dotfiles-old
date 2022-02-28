#!/bin/zsh
if $1 ; then
	open "$2"
else
	open -a "Sublime Text" "${@:2}"
fi
