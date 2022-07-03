#!/usr/bin/env zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

download_location="${download_location/#\~/$HOME}"
cd "$download_location" || exit 1

youtube-dl --format $output_format "$*" 2>&1
