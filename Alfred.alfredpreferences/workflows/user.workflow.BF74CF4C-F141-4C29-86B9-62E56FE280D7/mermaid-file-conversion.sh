#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

mm_file="$*"
output_location="${mm_file%.*}"".png"

mmdc -i "$mm_file" --scale $scale_factor -o "$output_location"
open -R "$output_location"
