# shellcheck disable=SC2010,SC2012

# switch to next Alacritty color scheme
function next () {
	local COLOR_DIR=~/.config/alacritty/colors
	local CURRENT NEXT

	CURRENT=$(alacritty-colorscheme status)
	NEXT=$(ls "$COLOR_DIR" | grep -A1 "$CURRENT" | tail -n1)
	[[ "$CURRENT" == "$NEXT" ]] && NEXT=$(ls "$COLOR_DIR" | head -n1)
	alacritty-colorscheme apply "$NEXT"
	echo "$CURRENT --> $NEXT"
}

# switch to previous Alacritty color scheme
function prev () {
	local COLOR_DIR=~/.config/alacritty/colors
	local CURRENT PREVIOUS

	CURRENT=$(alacritty-colorscheme status)
	PREVIOUS=$(ls "$COLOR_DIR" | grep -B1 "$CURRENT" | head -n1)
	[[ "$CURRENT" == "$PREVIOUS" ]] && PREVIOUS=$(ls "$COLOR_DIR" | tail -n1)
	alacritty-colorscheme apply "$PREVIOUS"
	echo "$PREVIOUS <-- $CURRENT"
}
