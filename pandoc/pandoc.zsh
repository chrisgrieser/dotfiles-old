# shellcheck disable=SC2215

function pd () {
	INPUT_PATH="$*"
	OUTPUT_PATH="${INPUT_PATH%.*}_CG.docx"

	pandoc \
		"$INPUT_PATH" \
		--defaults=Word \
		--output="$OUTPUT_PATH" \
		--metadata date:"$(date "+%e. %B %Y")"

	open -R "$OUTPUT_PATH"
}


# ------------------

# Pandoc Completions, https://groups.google.com/g/pandoc-discuss/c/Ot019yRiJFQ/m/VPchuJRkBQAJ
autoload -U +X bashcompinit && bashcompinit
eval "$(pandoc --bash-completion)"
