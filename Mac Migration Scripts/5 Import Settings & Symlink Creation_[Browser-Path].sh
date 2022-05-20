cd ~/Desktop || return

#Application Support
mkdir -p ~'/Library/Application Support/Alfred/Workflow Data/com.vdesabou.spotify.mini.player/'
mv -v 'Spotify-Mini-Player/' ~'/Library/Application Support/Alfred/Workflow Data/com.vdesabou.spotify.mini.player/'

# Fonts
mkdir -p ~'/Library/Fonts'
mv -v 'Fonts/'* ~'/Library/Fonts'

# iCloud
mv -vR 'iCloud-Folder/'*(D) ~"/Library/Mobile Documents/com~apple~CloudDocs"

# Browser-Default-Folder
mkdir -p ~"/Library/Application Support/BraveSoftware/Brave-Browser/Default/"
mv ~"/Library/Application Support/BraveSoftware/Brave-Browser/Default/" ~/.Trash
mv -vR 'Browser-Default-Folder/'* ~"/Library/Application Support/BraveSoftware/Brave-Browser/Default/"

# -----------

# Symlink Dotfiles
SYMLINK_LOC=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/"

mv ~/.zshrc ~/.Trash
ln -s "$SYMLINK_LOC/zsh/.zshrc" ~
mv ~/.zprofile ~/.Trash
ln -s "$SYMLINK_LOC/zsh/.zprofile" ~
ln -s "$SYMLINK_LOC/zsh/.zlogin" ~

ln -s "$SYMLINK_LOC/.searchlink" ~
ln -s "$SYMLINK_LOC/.shellcheckrc" ~
ln -s "$SYMLINK_LOC/.stylelintrc.json" ~
ln -s "$SYMLINK_LOC/.gitconfig" ~
ln -s "$SYMLINK_LOC/.eslintrc.json" ~
ln -s "$SYMLINK_LOC/.gitignore_global" ~
ln -s "$SYMLINK_LOC/pandoc" ~/.pandoc
ln -s "$SYMLINK_LOC/.markdownlintrc" ~

ln -s "$SYMLINK_LOC/.vimrc" ~
ln -s "$SYMLINK_LOC/.pylintrc" ~
ln -s "$SYMLINK_LOC/.flake8" ~

# .config
mv ~/.config ~/.Trash
ln -s "$SYMLINK_LOC/.config/" ~/.config

# Sublime
mv ~"/Library/Application Support/Sublime Text/Packages/User" ~/.Trash
ln -s "$SYMLINK_LOC/Sublime User Folder/" ~"/Library/Application Support/Sublime Text/Packages/User"
mv ~"/Library/Application Support/Sublime Text/Installed Packages/CSS3.sublime-package" ~/.Trash
ln -s "$SYMLINK_LOC/Sublime Packages/CSS3.sublime-package" ~"/Library/Application Support/Sublime Text/Installed Packages"

# -------------------
# only on main device
# -------------------

# Dock and Launchpad
mv ~"/Library/Application Support/Dock" ~/.Trash
ln -s "$SYMLINK_LOC/Dock and Launchpad" ~"/Library/Application Support/Dock"

# Brave
mv ~"/Applications/Brave Browser Apps.localized" ~/.Trash
ln -s "$SYMLINK_LOC/../Brave Browser Apps.localized/" ~"/Applications/Brave Browser Apps.localized"

# Folder Actions
mv -f ~"/Library/Workflows/Applications/Folder Actions" ~/.Trash
ln -s "$SYMLINK_LOC/Folder Actions/" ~"/Library/Workflows/Applications/Folder Actions"

# VLC
mv -f ~"/Library/Preferences/org.videolan.vlc/vlcrc" ~/.Trash
mkdir -p ~"/Library/Preferences/org.videolan.vlc/"
ln -s "$SYMLINK_LOC/vlcrc" ~"/Library/Preferences/org.videolan.vlc/vlcrc"

# --------------
# seperate import plist, explanation https://manytricks.com/osticket/kb/faq.php?id=53
# defaults import com.manytricks.Moom com.manytricks.Moom.plist

# import preferences
# untested yet, should work though: https://github.com/koalaman/shellcheck/wiki/Sc2045#correct-code
cd ~/Desktop/Preferences/ || return
for f in *.plist ; do
	[[ -e "$f" ]] || break  # handle the case of no *.plist files
	basename "$f" .plist
	defaults import "$f" "$f".plist
done

for d in */ ; do
	mv -v "$d" ~/Library/Preferences/
done





