#!/bin/zsh
URL=$(osacript -e "tell application \"Vivaldi\" to return URL of active tab of front window")

curl -L -O "$URL"
