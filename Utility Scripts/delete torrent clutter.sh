#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
VIDEO_DIR=~'/Video/Downloaded'

find "$VIDEO_DIR" \
	-name '*.txt' \
	-or -name '*.nfo' \
	-or -name '*.exe' \
	-or -name '*.md' \
	-or -name '*.jpg'

# shellcheck disable=SC2012
cd "$VIDEO_DIR/$(ls -tc "$VIDEO_DIR" | head -n1)" || exit 1



MOVIE=$(find ~'/Video/Downloaded' -name '*.mp4' -mtime -1m -or -name '*.mkv' -mtime -1m)
subliminal download -l en "$MOVIE"

sleep 2
osascript -e 'tell application "Transmission" to quit'
