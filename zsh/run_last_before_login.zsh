# color script
bash "$ZSH_DOTFILE_LOCATION"/plugins/colorscript.bash --random
echo ""
# weather
curl -s "https://wttr.in/Berlin?format=3" | tr -d "+"
echo ""
