#!/bin/zsh

# Config
MAILAPP=Mimestream

# IF SELECTION IS...
# file path: reveal it
# directory path: open it
# url: open in Browser
# email: send to that adress
# some other text: google it
# empty: do nothing

SEL="$*"
SEL="${SEL/#\~/$HOME}"

if [[ -f "$SEL" ]]; then
	open -R "$SEL"
elif [[ -d "$SEL" ]]; then
	open "$SEL"
elif [[ "$SEL" =~ ^[[:space:]]*http.*[[:space:]]*$ ]]; then
	# [[:space:]] ensures leading/trailing space does not prevent triggering
	URL=$(echo "$SEL" | tr -d " ")
	open "$URL"
elif [[ "$SEL" =~ "@" ]]; then
	MAIL=$(echo "$SEL" | tr -d " ")
	open -a "$MAILAPP" "mailto:$MAIL"
elif [[ -n "$SEL" ]]; then
	open "https://www.google.com/search?q=$SEL"
fi
