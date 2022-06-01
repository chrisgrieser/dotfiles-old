cd ~/Desktop || return

# -------------------

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
# Special Cases
# -------------------
# Obsidian vimrcs
VAULT_PATH=~'/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault'
ln -sf "$DOTFILE_FOLDER/obsidian.vimrc" "$VAULT_PATH/Meta"
ln -sf "$DOTFILE_FOLDER/obsidian.vimrc" "$VAULT_PATH/../Development"

# Brave
BROWSER="Brave Browser"
mv ~"/Applications/$BROWSER Apps.localized" ~/.Trash
ln -sf "$DOTFILE_FOLDER/../$BROWSER Apps.localized/" ~"/Applications/$BROWSER Apps.localized"

# VLC
mv -f ~"/Library/Preferences/org.videolan.vlc/vlcrc" ~/.Trash
mkdir -p ~"/Library/Preferences/org.videolan.vlc/"
ln -sf "$DOTFILE_FOLDER/vlcrc" ~"/Library/Preferences/org.videolan.vlc/vlcrc"

