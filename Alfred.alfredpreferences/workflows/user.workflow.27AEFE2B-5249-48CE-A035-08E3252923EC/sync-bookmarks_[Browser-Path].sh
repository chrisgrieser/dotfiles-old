#!/usr/bin/env zsh

BROWSER="BraveSoftware/Brave-Browser"

CHROME_FOLDER=~'/Library/Application Support/Google/Chrome'
TARGET_BOOKMARKS=~"/Library/Application Support/$BROWSER/Default/Bookmarks"
CHROME_BOOKMARKS="$CHROME_FOLDER/Default/Bookmarks"

[[ ! -d "$CHROME_FOLDER/Default" ]] && mkdir -p "$CHROME_FOLDER/Default"
if [[ "$TARGET_BOOKMARKS" -nt "$CHROME_BOOKMARKS" ]]; then
	cp -f "$TARGET_BOOKMARKS" "$CHROME_BOOKMARKS"
	cp -f ~"/Library/Application Support/$BROWSER/Local State" "$CHROME_FOLDER/Local State"
fi
