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
DOTFILE_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/"
mv ~/.zshrc ~/.Trash
ln -sf "$DOTFILE_FOLDER/zsh/.zshrc" ~
mv ~/.zprofile ~/.Trash
ln -sf "$DOTFILE_FOLDER/zsh/.zprofile" ~
ln -sf "$DOTFILE_FOLDER/zsh/.zlogin" ~

ln -sf "$DOTFILE_FOLDER/.searchlink" ~
ln -sf "$DOTFILE_FOLDER/.shellcheckrc" ~
ln -sf "$DOTFILE_FOLDER/.stylelintrc.json" ~
ln -sf "$DOTFILE_FOLDER/.gitconfig" ~
ln -sf "$DOTFILE_FOLDER/.eslintrc.json" ~
ln -sf "$DOTFILE_FOLDER/.gitignore_global" ~
ln -sf "$DOTFILE_FOLDER/pandoc" ~/.pandoc
ln -sf "$DOTFILE_FOLDER/.markdownlintrc" ~

ln -sf "$DOTFILE_FOLDER/.pylintrc" ~
ln -sf "$DOTFILE_FOLDER/.flake8" ~

ln -sf "$DOTFILE_FOLDER/.vimrc" ~
ln -sf "$DOTFILE_FOLDER/obsidian.vimrc" "$VAULT_PATH/Meta"

# .config
mv ~/.config ~/.Trash
ln -sf "$DOTFILE_FOLDER/.config/" ~/.config

# Sublime
mv ~"/Library/Application Support/Sublime Text/Packages/User" ~/.Trash
ln -sf "$DOTFILE_FOLDER/Sublime User Folder/" ~"/Library/Application Support/Sublime Text/Packages/User"
mv ~"/Library/Application Support/Sublime Text/Installed Packages/CSS3.sublime-package" ~/.Trash
ln -sf "$DOTFILE_FOLDER/Sublime Packages/CSS3.sublime-package" ~"/Library/Application Support/Sublime Text/Installed Packages"

# Folder Actions
mv -f ~"/Library/Workflows/Applications/Folder Actions" ~/.Trash
ln -sf "$DOTFILE_FOLDER/Folder Actions/" ~"/Library/Workflows/Applications/Folder Actions"

# -------------------
# only on main device
# -------------------

# Dock and Launchpad
mv ~"/Library/Application Support/Dock" ~/.Trash
ln -s "$DOTFILE_FOLDER/Dock and Launchpad" ~"/Library/Application Support/Dock"

# Brave
mv ~"/Applications/Brave Browser Apps.localized" ~/.Trash
ln -s "$DOTFILE_FOLDER/../Brave Browser Apps.localized/" ~"/Applications/Brave Browser Apps.localized"

# VLC
mv -f ~"/Library/Preferences/org.videolan.vlc/vlcrc" ~/.Trash
mkdir -p ~"/Library/Preferences/org.videolan.vlc/"
ln -s "$DOTFILE_FOLDER/vlcrc" ~"/Library/Preferences/org.videolan.vlc/vlcrc"

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

cd "$DOTFILE_FOLDER" || return 1
defaults import com.knollsoft.Charmstone com.knollsoft.Charmstone.plist
