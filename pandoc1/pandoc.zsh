# shellcheck disable=SC2215

function pd () {
	INPUT_PATH="$*"
	OUTPUT_PATH="${INPUT_PATH%.*}.docx"
	R_PATH="$(dirname "$INPUT_PATH")/attachments"

	pandoc \
		"$INPUT_PATH" \
		--defaults="$ZSH_DOTFILE_LOCATION/../pandoc/pandoc-defaults.yml" \
		--output="$OUTPUT_PATH" \
		--resource-path="$R_PATH" \
		-M date="$(date "+%e. %B %Y")"
}

# Pandoc Completions, https://groups.google.com/g/pandoc-discuss/c/Ot019yRiJFQ/m/VPchuJRkBQAJ
autoload -U +X bashcompinit && bashcompinit
eval "$(pandoc --bash-completion)"
