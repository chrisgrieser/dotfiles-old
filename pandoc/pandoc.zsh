# shellcheck disable=SC2215

function docx () {
	cd "$(dirname "$*")" || return
	INPUT_FILE="$(basename "$*")"
	OUTPUT_FILE="${INPUT_FILE%.*}_$(date "+%Y-%m-%d").docx"

	pandoc \
		"$INPUT_FILE" \
		--output="$OUTPUT_FILE" \
		--defaults=Paper-Word \
		--metadata=date:"$(date "+%d. %B %Y")"

	open -R "$OUTPUT_FILE"
}


# ------------------

# Pandoc Completions, https://groups.google.com/g/pandoc-discuss/c/Ot019yRiJFQ/m/VPchuJRkBQAJ
autoload -U +X bashcompinit && bashcompinit
eval "$(pandoc --bash-completion)"
