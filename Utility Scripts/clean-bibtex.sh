#!/bin/zsh

LIBRARY_PATH=~"/Library/Mobile Documents/com~apple~CloudDocs/Academia/Publikationen & Vorträge/2020 - Algorithmen als Rankings plus x mit Simon/Full Paper/Literaturangaben.bib"

grep -vw "month =" "$LIBRARY_PATH" | grep -vw "issn =" | grep -vw "file =" > ./temp.bib
mv ./temp.bib "$LIBRARY_PATH"

sed -E -i '' 's/date = {([[:digit:]]{4}).*}/year = {\1}/g' "$LIBRARY_PATH"
sed -i '' 's/journaltitle = /journal = /g' "$LIBRARY_PATH"
sed -i '' 's/note = /annotate = /g' "$LIBRARY_PATH"
