#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH

# remove code fence
mm_code=$(echo "$*" | grep -v '\`\`\`')
output_location=~$(echo -n $output_location | sed -e "s/^~//")/chart.png

echo "$mm_code" | mmdc --scale $scale_factor -o "$output_location"
open -R "$output_location"
