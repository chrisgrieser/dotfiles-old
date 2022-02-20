#!/bin/zsh

# change to target
STICK="/Volumes/CG_Stick"


# ----------------------------

# TODO Script to create 'pw.md'

cd "$STICK" || exit
brew bundle dump --force

# Installation Scripts
cp -R ~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Mac Installation Scripts' .

# Keeweb
cp ~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Authentification/log11.kdbx' .
cp ~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Authentification/log11.key' .
cp -R '/Applications/KeeWeb.app' .
cp -R ~'/Library/Application Support/KeeWeb' .

# open folder afterwards
open .
