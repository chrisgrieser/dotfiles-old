#!/bin/zsh
brew uninstall vivaldi
curl -O "https://raw.githubusercontent.com/Homebrew/homebrew-cask/12fb18c03b7a4ecfde7fe58813fc862345c68031/Casks/vivaldi.rb"
brew install --cask vivaldi.rb
rm -f vivaldi.rb

# icon
ICON_FOLDER=~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Custom Icons/'
cp "$ICON_FOLDER"'Vivaldi Red.icns' '/Applications/Vivaldi.app/Contents/Resources/app.icns'
touch '/Applications/Vivaldi.app'

# Mods
cd "/Applications/Vivaldi.app/Contents/Frameworks/Vivaldi Framework.framework/Versions/Current/Resources/vivaldi/"
cp ~"/Library/Mobile Documents/com~apple~CloudDocs/Dokumente/Code/Vivaldi/web_panel_zoom.js" .

# https://stackoverflow.com/a/25306308
sed -i '' '/<\/body>/i\
\
    <script src="web_panel_zoom.js"></script>
' browser.html

