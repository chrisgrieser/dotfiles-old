cd ~/Desktop || return 1

# -------------------

DOTFILE_FOLDER=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Dotfiles/"
rm -rf ~/.zshrc
ln -sf "$DOTFILE_FOLDER/zsh/.zshrc" ~
rm -rf ~/.zprofile
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
rm -rf ~/.config
ln -sf "$DOTFILE_FOLDER/.config/" ~/.config

# Hammerspoon
[[ -e ~/.hammerspoon ]] && rm -rf ~/.hammerspoon
ln -sf "$DOTFILE_FOLDER/hammerspoon" ~/.hammerspoon

# Espanso
ESPANSO_DIR=~"/Library/Application Support/espanso"
[[ -e "$ESPANSO_DIR" ]] && rm -rf "$ESPANSO_DIR"
ln -sf "$DOTFILE_FOLDER/espanso/" "$ESPANSO_DIR"

# Sublime
rm -rf ~"/Library/Application Support/Sublime Text/Packages/User"
ln -sf "$DOTFILE_FOLDER/Sublime User Folder/" ~"/Library/Application Support/Sublime Text/Packages/User"
rm -rf ~"/Library/Application Support/Sublime Text/Installed Packages/CSS3.sublime-package"
ln -sf "$DOTFILE_FOLDER/Sublime Packages/CSS3.sublime-package" ~"/Library/Application Support/Sublime Text/Installed Packages"

# Folder Actions
rm -rf ~"/Library/Workflows/Applications/Folder Actions"
ln -sf "$DOTFILE_FOLDER/Folder Actions/" ~"/Library/Workflows/Applications/Folder Actions"

# -------------------
# Special Cases
# -------------------
# Obsidian vimrc
VAULT_PATH=~'/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault'
VAULT_PATH2=~'/Library/Mobile Documents/iCloud~md~obsidian/Documents/Development'
ln -sf "$DOTFILE_FOLDER/obsidian.vimrc" "$VAULT_PATH/Meta"
ln -sf "$DOTFILE_FOLDER/obsidian.vimrc" "$VAULT_PATH2/Meta"
ln -sf "$DOTFILE_FOLDER/obsidian-vim-helpers.js" "$VAULT_PATH/Meta"
ln -sf "$DOTFILE_FOLDER/obsidian-vim-helpers.js" "$VAULT_PATH2/Meta"

# Brave
BROWSER="Brave Browser"
rm -rf ~"/Applications/$BROWSER Apps.localized"
ln -sf "$DOTFILE_FOLDER/../$BROWSER Apps.localized/" ~"/Applications/$BROWSER Apps.localized"

# VLC
rm -rf ~"/Library/Preferences/org.videolan.vlc/vlcrc"
mkdir -p ~"/Library/Preferences/org.videolan.vlc/"
ln -sf "$DOTFILE_FOLDER/vlcrc" ~"/Library/Preferences/org.videolan.vlc/vlcrc"

