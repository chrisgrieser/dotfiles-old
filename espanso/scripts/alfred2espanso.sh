#!/bin/zsh

# Alfred snippets to Espanso

cd "/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/Alfred.alfredpreferences/snippets/"


for folder in */; do
	cd "$folder"
	echo "$PWD"
	NAME=$(basename "$PWD")
	for f in *.json ; do
		f=$(basename "$f" .json)
		yq -P '.' "$f.json" >> "$NAME.yml"
	done
	cd ..
done
