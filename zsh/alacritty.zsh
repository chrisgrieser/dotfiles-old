

# switch to next Alacritty color scheme
function next () {
	local COLOR_DIR=~/.config/alacritty/colors
	local CURRENT NEXT

	CURRENT=$(alacritty-colorscheme status)
	NEXT=$(find "$COLOR_DIR" -print0 | xargs -0 basename | grep -A1 "$CURRENT" | tail -n1)
	[[ "$CURRENT" == "$NEXT" ]] && NEXT=$(find "$COLOR_DIR" -print0 | xargs -0 basename | head -n1)
	alacritty-colorscheme apply "$NEXT"
	echo "$CURRENT --> $NEXT"
}

# switch to previous Alacritty color scheme
function prev () {
	local COLOR_DIR=~/.config/alacritty/colors
	local CURRENT PREVIOUS

	CURRENT=$(alacritty-colorscheme status)
	PREVIOUS=$(find "$COLOR_DIR" -print0 | xargs -0 basename | grep -B1 "$CURRENT" | head -n1)
	[[ "$CURRENT" == "$PREVIOUS" ]] && PREVIOUS=$(find "$COLOR_DIR" -print0 | xargs -0 basename | tail -n1)
	alacritty-colorscheme apply "$PREVIOUS"
	echo "$PREVIOUS <-- $CURRENT"
}

# select a Alacritty theme, requires fzf
function theme () {
	local COLOR_DIR=~/.config/alacritty/colors
	local CURRENT SELECTED

	CURRENT=$(alacritty-colorscheme status)
	SELECTED=""
	SELECTED=$(find "$COLOR_DIR" -print0 | xargs -0 basename | fzf --query "$*" -0 -1)
	[[ "$SELECTED" == "" ]] && return 130

	alacritty-colorscheme apply "$SELECTED"
	echo "$CURRENT ~~> $SELECTED"
}
