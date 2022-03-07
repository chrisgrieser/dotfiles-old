#!/bin/zsh

LIBRARY_PATH="${LIBRARY_PATH/#\~/$HOME}"

# shellcheck disable=SC2154
grep -vw "month =" "$LIBRARY_PATH" | grep -vw "issn =" | grep -vw "file =" > "$alfred_workflow_cache"/temp.bib
mv "$alfred_workflow_cache"/temp.bib "$LIBRARY_PATH"

# fixes publication dates and journal for import of BibLaTeX from Zotero to BibDesk
sed -E -i '' 's/date = {([[:digit:]]{4}).*}/year = {\1}/g' "$LIBRARY_PATH"
sed -i '' 's/journaltitle = /journal = /g' "$LIBRARY_PATH"
sed -i '' 's/note = /annotate = /g' "$LIBRARY_PATH"
