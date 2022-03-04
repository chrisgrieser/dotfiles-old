# shellcheck disable=SC2215

function pd () {
	INPUT_PATH="$1"
	OUTPUT_PATH="${INPUT_PATH%.*}.docx"
	R_PATH="$(dirname "$INPUT_PATH")/attachments"

	pandoc \
		"$INPUT" \
		-M date="$(date "+%e. %B %Y")" \
		--defaults="$ZSH_DOTFILE_LOCATION/../pandoc/pandoc-defaults.yml" \
		--output="$OUTPUT_PATH" \
		--resource-path="$R_PATH"
}

# Pandoc Completions, https://groups.google.com/g/pandoc-discuss/c/Ot019yRiJFQ/m/VPchuJRkBQAJ
autoload -U +X bashcompinit && bashcompinit
eval "$(pandoc --bash-completion)"
