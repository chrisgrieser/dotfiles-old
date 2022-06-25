#!/usr/bin/env zsh
QUERY=$(echo "$*" | tr " " "+")
CHEAT=$(curl -s "https://cht.sh/$QUERY?T")

# copy to clipboard
echo "$CHEAT" | pbcopy

# highlighted preview window via peek
LANG="sh"
[[ "$QUERY" =~ "/" ]] && LANG=$(echo "$QUERY" | cut -d"/" -f1)
# shellcheck disable=SC2154

[[ ! -d "$alfred_workflow_cache" ]] && mkdir -p "$alfred_workflow_cache"
CACHE="$alfred_workflow_cache/temp.$LANG"
echo "$CHEAT" > "$CACHE"
qlmanage -p "$CACHE"
