# - working directory set through Alfred Workflow, therefore not done here
# - if done manually, set working directory to external drive
# ------------------------------------------------------------------------

# Brewfile & NPM file dump
BREWDUMP_PATH=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Homebrew & NPM Installs/"
DEVICE_NAME=$(scutil --get ComputerName)

brew bundle dump --force --file "$BREWDUMP_PATH"/Brewfile_"$DEVICE_NAME"
npm list -g --parseable | sed "1d" | sed -E "s/.*\///" > "$BREWDUMP_PATH"/NPMfile_"$DEVICE_NAME"

# Preferences
cp -vR ~'/Library/Preferences' .

# Containers (Pref Location for Mac App Store Apps)
cp -vR ~'/Library/Containers/com.busymac.busycal3' ./Containers
cp -vR ~'/Library/Containers/com.agiletortoise.Drafts-OSX' ./Containers
cp -vR ~'/Library/Containers/com.pixelmatorteam.pixelmator.x' ./Containers
cp -vR ~'/Library/Containers/com.iconfactory.Twitterrific5' ./Containers
cp -vR ~'/Library/Containers/com.mimestream.Mimestream' ./Containers
cp -vR ~'/Library/Containers/com.sindresorhus.Gifski' ./Containers
cp -vR ~'/Library/Containers/com.giorgiocalderolla.Catch.CatchFeedHelper' ./Containers

# Application Support
cp -vR ~'/Library/Application Support/BibDesk' ./Application-Support
cp -vR ~'/Library/Application Support/Alfred' ./Application-Support
cp -vR ~'/Library/Application Support/BraveSoftware' ./Application-Support

# Fonts
cp -vR ~'/Library/Fonts' ./Fonts

# Home Folder
mkdir -p 'Homefolder/Games'
sleep 0.5
cp -vR ~'/Games' ./Homefolder

# iCloud
cp -vR ~'/Library/Mobile Documents/com~apple~CloudDocs' ./iCloud-Folder

mkdir -p 'Homefolder/Video'
cp -vR ~'/Video' ./Homefolder
# mkdir -p 'Homefolder/RomComs'
# cp -vR ~'/RomComs' ./Homefolder
