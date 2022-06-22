#!/usr/bin/env zsh

killall "espanso" # needs to be lowercase
sleep 1
open -a "Espanso"
echo "🟨 Espanso restarted"
