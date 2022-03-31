#!/bin/zsh
# shellcheck disable=SC2164
# Reorganize PDFs by moving all pdfs one level up
# not usable anymore, but kept for documentation purposes

for folder in */*/; do
	cd "$folder"
	echo "$PWD"
	fd . --min-depth=2 | xargs -I {} mv {} . # move up when in author-folder
	cd ../..
done

for folder in */*/; do
	cd "$folder"
	rmdir ./*/ # remove all directories that are now empty
	cd ../..
done

for folder in */*/; do
	cd "$folder"
	rm -rf ./????/ # remove all directories with year numbers
	cd ../..
done
