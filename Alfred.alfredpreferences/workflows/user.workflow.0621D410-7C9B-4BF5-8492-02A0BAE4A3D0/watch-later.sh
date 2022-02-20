#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

URL="$*"
YOUTUBE_ID=$(echo "$URL" | cut -d "=" -f2)
TITLE=$(curl -s "$URL" | grep -o "<title>[^<]*" | cut -d'>' -f2- | sed -E 's/\:/-/g' | sed -E 's/ - YouTube//' )
IMAGE_URL="https://img.youtube.com/vi/""$YOUTUBE_ID""/0.jpg"
BOOKMARK_PATH="${youtube_link_folder/#\~/$HOME}""/$TITLE.url"

echo "[InternetShortcut]\nURL=$URL\nIconIndex=0" > "$BOOKMARK_PATH"
curl -sL "$IMAGE_URL" > temp.jpg
fileicon -q set "$BOOKMARK_PATH" temp.jpg
mv temp.jpg ~/.trash

# return for notification
echo -n "$TITLE"

