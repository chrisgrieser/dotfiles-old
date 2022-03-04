#!/bin/zsh
cd "$(dirname "$0")"

killall "Vivaldi"
brew uninstall vivaldi
brew install --cask vivaldi.rb

# icon
ICON_FOLDER=~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/'
cp "$ICON_FOLDER"'Vivaldi Red.icns' '/Applications/Vivaldi.app/Contents/Resources/app.icns'
touch '/Applications/Vivaldi.app'

# Mods
cd "/Applications/Vivaldi.app/Contents/Frameworks/Vivaldi Framework.framework/Versions/Current/Resources/vivaldi/" || return
cp ~"/Library/Mobile Documents/com~apple~CloudDocs/Dokumente/Code/Vivaldi/web_panel_zoom.js" .

# https://stackoverflow.com/a/25306308
sed -i '' '/<\/body>/i\
\
    <script src="web_panel_zoom.js"></script>
' browser.html

open -a "Vivaldi"
