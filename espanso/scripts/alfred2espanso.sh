#!/bin/zsh

# Convert Alfred snippets to Espanso files
# ----------------------------------------------
TARGET="$WD"
# path to your Alfred snippets
SNIPPET_FOLDER="/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/Alfred.alfredpreferences/snippets/"

cd "$SNIPPET_FOLDER" || return 1

for folder in */; do
	cd "$folder" || return 1
	echo "$PWD"

	NAME=$(basename "$PWD")
	for f in *.json ; do
		f=$(basename "$f" .json)
		yq -P '.' "$f.json" >> "$TARGET/$NAME.yml"
	done

	cd ..
done

TARGET="$WD"
cd "$TARGET" || return 1
for file in *.yml; do
	echo "$file"
	sed -i '' '/alfredsnippet:/d' "$file"
	sed -i '' '/uid:/d' "$file"
	sed -i '' '/dontautoexpand:/d' "$file"
	sed -i '' 's/snippet:/replace:/g' "$file"
	sed -i '' 's/name:/label:/g' "$file"
	sed -i '' 's/  keyword:/- trigger:/g' "$file"
	sed -i '' 's/{cursor}/\$\|\$/g' "$file"
done

