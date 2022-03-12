#!/bin/zsh
# shellcheck disable=SC2002

LIBRARY_PATH=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/pandoc/main-bibliography.bib"

# move curly braces down a line for better editing
cat "$LIBRARY_PATH" | tr "\n" "§" | sed 's/}}§§@/}§}§§@/g'| tr "§" "\n" > ./temp.bib
mv ./temp.bib "$LIBRARY_PATH"

# remove unused fields
grep -vw "month =" "$LIBRARY_PATH" \
	| grep -vw "issn =" \
	| grep -vw "file =" \
	| grep -vw "langid =" \
	| grep -vw "urlyear =" \
	| grep -vw "abstract =" \
	| grep -vw "shorttitle =" \
	| grep -vw "eprint =" \
	| grep -vw "eprinttype =" \
	| grep -vw "shortjournal =" \
	> ./temp.bib
mv ./temp.bib "$LIBRARY_PATH"

cat "$LIBRARY_PATH" | tr "\n" "§" | sed 's/,§}/§}/g'| tr "§" "\n" > ./temp.bib
mv ./temp.bib "$LIBRARY_PATH"

# fix common problems
sed -E -i '' 's/date = {([[:digit:]]{4}).*}/year = {\1}/g' "$LIBRARY_PATH"
sed -i '' 's/journaltitle = /journal = /g' "$LIBRARY_PATH"
sed -i '' 's/note = /annotate = /g' "$LIBRARY_PATH"

# INFO: in some cases, the last entry must be fixed manually
