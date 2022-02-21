#!/bin/zsh
export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH
FED_NUMBERS=$(curl -sL "https://api.corona-zahlen.org/germany")
INZ=$(echo "$FED_NUMBERS" | jq .weekIncidence | cut -d "." -f1)
R=$(echo "$FED_NUMBERS" | jq .r.rValue7Days.value)

BE_INZ=$(curl -sL "https://api.corona-zahlen.org/states/BE" | jq .data.BE.weekIncidence | cut -d "." -f1)

echo "🦠 $INZ ($R)"
echo "---"
echo "BE: $BE_INZ"

