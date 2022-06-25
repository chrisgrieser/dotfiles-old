#!/bin/zsh

# IF SELECTION IS...
# file path: reveal it
# directory path: open it
# url: open in Browser
# some other text: google it
# empty: do nothing

SEL=$*
SEL="${SEL/#\~/$HOME}"

if [[ -f "$SEL" ]]; then
	open -R "$SEL"
elif [[ -d "$SEL" ]]; then
	open "$SEL"
elif [[ "$SEL" =~ ^[[:space:]]*http.*[[:space:]]*$ ]]; then
	# [[:space:]] ensures leading/trailing space does not prevent triggering
	open "$(echo "$SEL" | tr -d " ")"
elif [[ -n "$SEL" ]]; then
	open "https://www.google.com/search?q=$SEL"
fi
