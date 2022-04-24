#!/bin/zsh

DAILY_NOTE_PATH=~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/Daily Notes/"
TEMPLATE="---\ntags: archive\nobsidianUIMode: preview\n---\n\n#"

# ---

TODAY=$(date '+%Y-%m-%d')
CONTENT="$TEMPLATE $TODAY\n"
FILE_PATH="$DAILY_NOTE_PATH/$TODAY.md"

echo "$CONTENT" > "$FILE_PATH"
