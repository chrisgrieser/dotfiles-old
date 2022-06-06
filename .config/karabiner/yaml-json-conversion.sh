#!/bin/zsh

# https://mikefarah.gitbook.io/yq/usage/convert
# ---------------------------------------------

# Convert all json in the current directory to yaml
for f in *.json ; do
	f=$(basename "$f" .json)
	yq -P '.' "$f.json" > "$f.yaml"
done

# "compile" (convert) file from yaml to json
function yaml2json () {
	yq -o=json '.' "$1" > "$(basename "$1" .yaml).json"
}
