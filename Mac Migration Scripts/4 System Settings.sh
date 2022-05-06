#=========================================
# sources for mac default settings
# https://github.com/herrbischoff/awesome-macos-command-line
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://macos-defaults.com/
#=========================================
#=========================================

sudo -v

#=========================================
# Global Prefs
#=========================================
# these three need restart
# mouse speed: 3 = max speed from System Preferences
# https://mac-os-key-repeat.vercel.app/
defaults write -g com.apple.mouse.scaling  4.0
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# when to show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
# sidebar icon size (1-3)
defaults write -g AppleShowAllExtensions -bool true
# save menu settings
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# expand print menu by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

#=========================================
# System Prefs
#=========================================

# Network
# pw.md generated via keychain read before
WIFI=$(grep -i -A1 "WiFi" pw.md | tail -n1)
WIFI_NAME=$(echo "$WIFI" | cut -d" " -f1)
WIFI_PW=$(echo "$WIFI" | cut -d" " -f2)
networksetup -setairportnetwork en1 "$WIFI_NAME" "$WIFI_PW"

# Cloudflare DNS
# networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1
# networksetup -setdnsservers Ethernet 1.1.1.1 1.0.0.1

# Google DNS
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4
networksetup -setdnsservers Ethernet 8.8.8.8 8.8.4.4

# Screensaver Settings
defaults -currentHost write com.apple.screensaver showClock -int 0

# Dock
# -------------------------------
defaults write com.apple.dock tilesize -int 70
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock no-bouncing -bool false
# Speed up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mouse-over-hilite-stack -bool false
defaults write com.apple.dock minimize-to-application -bool false
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock show-process-indicators -bool true
# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1
# Don’t group windows by application in Mission Control (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool true
killall Dock


# -------------------------------
# Finder
# -------------------------------

# Set the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget 'PfHm'
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Library/Mobile%20Documents/com~apple~CloudDocs/File%20Hub"

# other settings
defaults write com.apple.finder FXEnableExtensionChangeWarning -int 0
defaults write com.apple.finder WarnOnEmptyTrash -int 0

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Views
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Show the ~/Library folder
chflags nohidden ~/Library

#search always current directory
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool false
killall Finder

# -------------------------------------------
# Spotlight Exclusions
# -------------------------------------------
# https://blog.christovic.com/2021/02/programatically-adding-spotlight.html
# https://github.com/mattprice/dotfiles/blob/master/scripts/spotlight-ignore.rb
# the "VolumeConfiguration.plist" sometimes needs to be recreated

SPOTLIGHT_CONFIG="/System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist"

sudo plutil -insert Exclusions.0 -string '/Applications/Utilities/' "$SPOTLIGHT_CONFIG"
sudo plutil -insert Exclusions.0 -string '/Applications/Cisco' "$SPOTLIGHT_CONFIG"
sudo plutil -insert Exclusions.0 -string ~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/zsh/plugins/fzf-tab' "$SPOTLIGHT_CONFIG"
sudo plutil -insert Exclusions.0 -string ~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/Alfred.alfredpreferences/workflows/' "$SPOTLIGHT_CONFIG"
sudo plutil -insert Exclusions.0 -string ~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Backups/' "$SPOTLIGHT_CONFIG"
sudo launchctl stop com.apple.metadata.mds
sudo launchctl start com.apple.metadata.mds

# show current exclusions
sudo plutil -extract Exclusions xml1 -o - "$SPOTLIGHT_CONFIG"

# remove an exclusion
# sudo plutil -remove Exclusions.{index} "$SPOTLIGHT_CONFIG"

# restart spotlight indexing
sudo mdutil -E -i on /
sudo rm -R "$SPOTLIGHT_CONFIG"

# -------------------------------------------

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
osascript -e 'tell application "System Events" to tell every desktop to set picture to POSIX file "/System/Library/Desktop Pictures/Solid Colors/Space Gray Pro.png"'

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Printer setting
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#turn on firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

#screenshots
defaults write com.apple.screencapture disable-shadow -bool false
defaults write com.apple.screencapture location -string "${HOME}/Library/Mobile Documents/com~apple~CloudDocs/File Hub"
defaults write com.apple.screencapture type -string "png"
killall SystemUIServer

# App Store Update freq
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 2
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Hot corners
#-------------------------------------------
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
#defaults write com.apple.dock wvous-tl-corner -int 2
#defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Notification Center
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

# Time Machine
#----------------
# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# disable automatic backups
sudo tmutil disable


# Safari
#--------------------------------------
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Disable auto-playing video
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# Download path
defaults write com.apple.Safari DownloadsPath -string ~"/Library/Mobile Documents/com~apple~CloudDocs/File Hub"

# Activity Monitor
#------------------
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# TextEdit
#------------------
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

