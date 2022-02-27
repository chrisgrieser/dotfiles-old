if [[ "$TERM_PROGRAM" != "Terminus-Sublime" ]] ; then
	# 33% art, 66% fortune
	if [[ $((RANDOM%3)) == 1 ]] ; then
		bash "$ZSH_DOTFILE_LOCATION"/plugins/colorscript.bash --random
	else
		echo
		echo "> $(fortune -n300 -s)"
		echo
	fi
fi

