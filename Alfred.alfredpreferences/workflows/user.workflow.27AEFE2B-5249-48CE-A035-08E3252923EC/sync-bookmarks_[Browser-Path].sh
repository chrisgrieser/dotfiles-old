#!/bin/zsh

BROWSER="BraveSoftware/Brave-Browser"

mkdir -p ~"/Library/Application Support/Google/Chrome/Default/"
cp ~"/Library/Application Support/$BROWSER/Default/Bookmarks" ~"/Library/Application Support/Google/Chrome/Default/Bookmarks"
cp ~"/Library/Application Support/$BROWSER/Local State" ~"/Library/Application Support/Google/Chrome/Local State"
cp ~"/Library/Application Support/$BROWSER/Default/History" ~"/Library/Application Support/Google/Chrome/Default/History"
