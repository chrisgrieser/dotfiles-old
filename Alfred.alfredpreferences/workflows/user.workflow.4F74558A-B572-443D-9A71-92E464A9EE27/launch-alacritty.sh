#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

DEVICE_NAME=$(scutil --get ComputerName)

cd ~ || exit

if [[ "$DEVICE_NAME" =~ "Mac mini" ]] ; then
	nohup alacritty &
else
	echo "bla"
fi
