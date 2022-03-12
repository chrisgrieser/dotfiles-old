#!/bin/zsh

LIBRARY_PATH=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/pandoc/main-bibliography.bib"

grep -vw "month =" "$LIBRARY_PATH" \
	| grep -vw "issn =" \
	| grep -vw "file =" \
	| grep -vw "langid =" \
	| grep -vw "urlyear =" \
	| grep -vw "bdsk-url-1 =" \
	| grep -vw "bdsk-url-2 =" \
	| grep -vw "abstract =" \
	| grep -vw "shorttitle =" \
	| grep -vw "shortjournal =" \
	> ./temp.bib
mv ./temp.bib "$LIBRARY_PATH"

# shellcheck disable=SC2002
cat "$LIBRARY_PATH" | tr "\n" "§" | sed 's/}}§§@/}§}§§@/g'| tr "§" "\n" > ./temp.bib
mv ./temp.bib "$LIBRARY_PATH"

sed -E -i '' 's/date = {([[:digit:]]{4}).*}/year = {\1}/g' "$LIBRARY_PATH"
sed -i '' 's/journaltitle = /journal = /g' "$LIBRARY_PATH"
sed -i '' 's/note = /annotate = /g' "$LIBRARY_PATH"
