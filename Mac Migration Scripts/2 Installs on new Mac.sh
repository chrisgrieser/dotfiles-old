sudo -v

# Install Homebrew itself
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# needed for php installation, php needed for Spotify workflow
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

# change setting of archive utility
open "/System/Library/CoreServices/Applications/Archive Utility.app"

# NPM https://stackoverflow.com/a/41199625
# add "--force" to enforce installation when there are already npm installs
cat ~'/Desktop/NPMfile' | xargs npm install -g
npm list -g

# Python / Pip installs
pip3 install alacritty-colorscheme #requires the python3 version installed by homebrew

# required for some Alfred workflows
# https://www.alfredapp.com/help/kb/python-2-monterey/
# https://github.com/alfredapp/updated-third-party-python2-workflows#workflows
brew install pyenv
pyenv install 2.7.18
ln -s "${HOME}/.pyenv/versions/2.7.18/bin/python2.7" "${HOMEBREW_PREFIX}/bin/python"

# -----------
# SETTINGS
# -----------

# Twitterific: run headless http://support.iconfactory.com/kb/twitterrific/advanced-settings-using-the-command-line-macos
defaults write com.iconfactory.Twitterrific5 advancedShowDockIcon -bool NO

# change font size of Portfolio Performance
font_size=19
c_css_location=~'/Library/Application Support/name.abuchen.portfolio.product/workspace/.metadata/.plugins/name.abuchen.portfolio.ui/'
mkdir -p "$c_css_location"
printf "%s" "{\nfont-size: ""$font_size"";\n}" >> "$c_css_location"/custom.css

# Mimestream as Default Mail Client (don't use newer python versions in this script)
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

# Fix Permission issue with Drafts, https://forums.getdrafts.com/t/open-file-links-with-app-openurl/11513/6
mkdir ~"/Library/Application Scripts/com.agiletortoise.Drafts-OSX"

# Sublime: Install Package Control https://packagecontrol.io/installation
curl -sL "https://packagecontrol.io/Package%20Control.sublime-package" > ~"/Library/Application Support/Sublime Text/Packages/"

