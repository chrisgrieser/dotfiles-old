sudo -v

# Install Homebrew itself
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# needed for php installation, php needed for SPotify workflow
xcode-select --install

# MAS CLI sign in currently broken due to Apple API change
# Sign in Bug: https://github.com/mas-cli/mas#-sign-in
# ➞ sign in manually to start download
open '/System/Applications/App Store.app'

# -------------
# INSTALLS
# -------------
brew bundle install --verbose --no-lock --file ~'/Desktop/Brewfile'

# Uninstall unneeded Mac Default apps
open -a "Appcleaner" \
    "/Applications/Numbers.app" \
    "/Applications/Pages.app/" \
    "/Applications/GarageBand.app" \
    "/Applications/Keynote.app" \
    "/Applications/iMovie.app"

# NPM https://stackoverflow.com/a/41199625
# add "--force" to enforce installation when there are already npm installs
cat ~'/Desktop/NPMfile' | xargs npm install -g
npm list -g

# Python
pip3 install pdfannots #requires the python3 version installed by homebrew

# -----------
# SETTINGS
# -----------

# Twitterific: run headless http://support.iconfactory.com/kb/twitterrific/advanced-settings-using-the-command-line-macos
defaults write com.iconfactory.Twitterrific5 advancedShowDockIcon -bool NO

# restrict KeeWeb access only to Admins
sudo chown -R root /Applications/KeeWeb.app

# change font size of Portfolio Performance
font_size=19
c_css_location=~'/Library/Application Support/name.abuchen.portfolio.product/workspace/.metadata/.plugins/name.abuchen.portfolio.ui/'
mkdir -p "$c_css_location"
printf "%s" "{\nfont-size: ""$font_size"";\n}" >> "$c_css_location"/custom.css

# Mimestream as Default Mail Client (nicht updaten auf neuere Python-Versionen)
# https://apple.stackexchange.com/a/351570
/usr/bin/python2.7 <<EOF
import LaunchServices;
result = LaunchServices.LSSetDefaultHandlerForURLScheme(
    "mailto",
    "com.mimestream.Mimestream")
print("Result: %d (%s)" % (
    result,
    "Success" if result == 0 else "Error"))
EOF

# Steam UI https://tp69.blog/2020/02/11/how-to-zoom-the-steam-client/
steamDataPath=~"/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS"
newSkinPath="$steamDataPath""/skins/Bigger UI"
mkdir -p "$newSkinPath"/resource/styles/
cp "$steamDataPath"/resource/styles/steam.styles "$newSkinPath"/resource/styles/
echo ":root { zoom: \"1.5\"; }" > "$newSkinPath"/resource/webkit.css

# ------------------
# Potentially needed
# ------------------

# Fix Permission issue with Drafts, https://forums.getdrafts.com/t/open-file-links-with-app-openurl/11513/6
# mkdir ~"/Library/Application Scripts/com.agiletortoise.Drafts-OSX"

# Sublime:
# - Install Package Control https://packagecontrol.io/installation
# curl -sL "https://packagecontrol.io/Package%20Control.sublime-package" > ~"/Library/Application Support/Sublime Text/Packages/"
# - link `subl` CLI
# echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.zprofile

# Homebrew: add to PATH
# shellcheck disable=SC2016,SC2086
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
# eval "$(/opt/homebrew/bin/brew shellenv)"
