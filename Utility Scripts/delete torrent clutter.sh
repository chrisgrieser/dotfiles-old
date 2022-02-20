#!/bin/zsh
export PATH=/usr/local/lib:/usr/local/bin:$PATH

find ~'/Video/Downloaded' -name '*.txt' -delete -or -name '*.nfo' -delete -or -name '*.exe' -delete
find ~'/Video/Downloaded' -name '*.md' -delete -or -name '*.jpg' -delete

#searches for all movies in the folder downloaded in the last minute
movie=`find ~'/Video/Downloaded' -name '*.mp4' -mtime -1m -or -name '*.mkv' -mtime -1m`
subliminal download -l en $movie

sleep 2
osascript -e 'tell application "Transmission" to quit'
