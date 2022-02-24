# has to be dont via script instead of sourced function
# to allow restarting of the whole app

if [[ "$TERM_PROGRAM" == "Terminus-Sublime" ]] ; then
	echo "Terminal restart not configured for Terminus."
	return 1
fi
if [[ "$TERM_PROGRAM" == "" ]]; then
	TO_RESTART="$TERM"
else
	TO_RESTART="$TERM_PROGRAM"
fi
osascript -e "tell application \"$TO_RESTART\" to quit"
sleep 1
open -a "$TO_RESTART"
