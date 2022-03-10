#!/bin/zsh

# Re-occuring task to Drafts
osascript -e 'tell application "Drafts" to make new draft with properties {content: "# RSS\n", tags: {"to do"}}'

# Re-index documentation for "Shimmering Obsidian"
osascript -e 'tell application id "com.runningwithcrayons.Alfred" to run trigger "re-index-doc-search" in workflow "de.chris-grieser.shimmering-obsidian" with argument ""'
