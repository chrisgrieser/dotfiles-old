#!/bin/zsh


LIBRARY_PATH="${LIBRARY_PATH/#\~/$HOME}"

grep -vw "month =" "$LIBRARY_PATH" > ~/temp.bib
mv ~/temp.bib "$LIBRARY_PATH"

grep -vw "issn =" "$LIBRARY_PATH" > ~/temp.bib
mv ~/temp.bib "$LIBRARY_PATH"

grep -vw "file =" "$LIBRARY_PATH" > ~/temp.bib
mv ~/temp.bib "$LIBRARY_PATH"

# fixes publication dates and journal for import of BibLaTeX from Zotero to BibDesk
sed -E 's/date = {([[:digit:]]{4}).*}/year = {\1}/g' "$LIBRARY_PATH" > ~/temp.bib
mv ~/temp.bib "$LIBRARY_PATH"
sed -E 's/journaltitle = /journal = /g' "$LIBRARY_PATH" > ~/temp.bib
mv ~/temp.bib "$LIBRARY_PATH"
sed -E 's/note = /annotate = /g' "$LIBRARY_PATH" > ~/temp.bib
mv ~/temp.bib "$LIBRARY_PATH"

echo -n "{query}"
