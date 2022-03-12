#!/bin/zsh
VIDEO_DIR=~'/Video/Downloaded'
SUB_LANG='en'

# ----------------------

export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

# delete clutter
find "$VIDEO_DIR" \
	-name '*.txt' -delete \
	-or -name '*.nfo' -delete \
	-or -name '*.exe' -delete \
	-or -name '*.md' -delete \
	-or -name '*.jpg' -delete \
	-or -name '*.jpeg' -delete \
	-or -name '*.png' -delete

# download subtitles in newest folder
# shellcheck disable=SC2012
NEW_FOLDER="$VIDEO_DIR/$(ls -tc "$VIDEO_DIR" | head -n1)"
subliminal download --language "$SUB_LANG" "$NEW_FOLDER"

# quit Transmission
sleep 1
osascript -e 'tell application "Transmission" to quit'
