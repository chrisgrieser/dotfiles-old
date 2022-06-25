#!/usr/bin/env zsh
QUERY=$(echo "$*" | sed 's/ /\//' | tr " " "+") # first space → /, all other spaces "+" for url
CHEAT=$(curl -s "https://cht.sh/$QUERY?T") # https://cht.sh/:help

# copy to clipboard
echo "$CHEAT" | pbcopy

# highlighted preview window via Peek
LANG="sh"
[[ "$QUERY" =~ "/" ]] && LANG=$(echo "$QUERY" | cut -d"/" -f1)
# shellcheck disable=SC2154
[[ ! -d "$alfred_workflow_cache" ]] && mkdir -p "$alfred_workflow_cache"
CACHE="$alfred_workflow_cache/temp.$LANG"
echo "$CHEAT" > "$CACHE"
qlmanage -p "$CACHE"
