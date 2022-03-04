#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

PROFILE="~/Library/Application Support/Vivaldi/Default"

python chrome.py "${PROFILE}" "$*"
