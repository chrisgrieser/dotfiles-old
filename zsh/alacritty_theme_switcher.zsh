# switch to next Alacritty color scheme
# shellcheck disable=SC2016
FIND_LS='find "$COLOR_DIR" -not -name "colors" -print0 | xargs -0 basename'
COLOR_DIR=~/.config/alacritty/colors
function next () {
	local CURRENT NEXT

	CURRENT=$(alacritty-colorscheme status)
	NEXT=$(eval "$FIND_LS" | grep -A1 "$CURRENT" | tail -n1)
	[[ "$CURRENT" == "$NEXT" ]] && NEXT=$(find "$COLOR_DIR" -print0 | xargs -0 basename | head -n1)
	alacritty-colorscheme apply "$NEXT"
	echo "$CURRENT --> $NEXT"
}

# switch to previous Alacritty color scheme
function prev () {
	local CURRENT PREVIOUS

	CURRENT=$(alacritty-colorscheme status)
	PREVIOUS=$(eval "$FIND_LS" | grep -B1 "$CURRENT" | head -n1)
	[[ "$CURRENT" == "$PREVIOUS" ]] && PREVIOUS=$(find "$COLOR_DIR" -print0 | xargs -0 basename | tail -n1)
	alacritty-colorscheme apply "$PREVIOUS"
	echo "$PREVIOUS <-- $CURRENT"
}

# select a Alacritty theme, requires fzf
function theme () {
	local CURRENT SELECTED

	CURRENT=$(alacritty-colorscheme status)
	SELECTED=""
	SELECTED=$(eval "$FIND_LS" | fzf --query "$*" -0 -1)
	[[ "$SELECTED" == "" ]] && return 130

	alacritty-colorscheme apply "$SELECTED"
	echo "$CURRENT ~~> $SELECTED"
}
