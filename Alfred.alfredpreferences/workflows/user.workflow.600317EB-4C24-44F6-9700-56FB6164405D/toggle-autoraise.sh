#!/bin/zsh

export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

if pgrep -qx "AutoRaise" ; then
	killall -z "AutoRaise"
	echo "AutoRaise disabled"
else
	AutoRaise
	echo "AutoRaise enabled"
fi
