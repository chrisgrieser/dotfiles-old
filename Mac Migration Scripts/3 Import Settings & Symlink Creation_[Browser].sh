cd ~/Desktop || return

# remove BusyCal Container first, as the app starts and therefore creates stuff
mv -v ~'/Library/Containers/com.busymac.busycal3' ~/.trash
# remove Sublime settings, since Sublime is sometimes used and therefore creates settings
mv -v ~'Application-Support/Sublime Text' ~/.trash

# -----------

#Application Support
mv -v 'Application-Support/'* ~'/Library/Application Support'

# Containers
mkdir -p ~'/Library/Containers/'
mv -v './Containers/' ~'/Library/Containers/'

# Fonts
mkdir ~'/Library/Fonts'
mv -v 'Fonts/'* ~'/Library/Fonts'

# iCloud
mv -vR 'iCloud-Folder/'*(D) ~"/Library/Mobile Documents/com~apple~CloudDocs"

# Vivaldi-Default-Folder
mv ~"/Library/Application Support/Vivaldi/Default/" ~/.Trash
mv -vR 'Vivaldi-Default-Folder/'*(D) ~"/Library/Application Support/Vivaldi/Default/"

# -----------

# Symlink Dotfiles
SYMLINK_LOC=~"/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/"
mv ~/.zshrc ~/.Trash
ln -s "$SYMLINK_LOC"/zsh/.zshrc .
mv ~/.zprofile ~/.Trash
ln -s "$SYMLINK_LOC"/zsh/.zprofile .
# mv -f ~/.fig/settings.json ~/.Trash
# ln -s "$SYMLINK_LOC"/fig-settings.json ~/.fig/settings.json

ln -s "$SYMLINK_LOC"/.searchlink ~
ln -s "$SYMLINK_LOC"/.shellcheckrc ~
ln -s "$SYMLINK_LOC"/.markdownlintrc ~
ln -s "$SYMLINK_LOC"/.stylelintrc.json ~
ln -s "$SYMLINK_LOC"/.gitconfig ~
ln -s "$SYMLINK_LOC"/.eslintrc ~
ln -s "$SYMLINK_LOC"/.finicky.js ~
ln -s "$SYMLINK_LOC"/.gitignore_global ~
ln -s "$SYMLINK_LOC"/pandoc ~/.pandoc

# Vivaldi
mv ~"/Applications/Chrome Apps.localized" ~/.Trash
ln -s "$SYMLINK_LOC/../Chrome Apps.localized/" ~"/Applications/Chrome Apps.localized"

# .config
mv ~/.config ~/.Trash
ln -s "$SYMLINK_LOC"/.config/ ~/.config

# Popclip
mv ~"/Library/Application Support/PopClip" ~/.Trash
ln -s "$SYMLINK_LOC/Popclip/" ~"/Library/Application Support/PopClip"

# xbar
mv ~"/Library/Application Support/xbar/plugins" ~/.Trash
ln -s "$SYMLINK_LOC/xbar plugins/" ~"/Library/Application Support/xbar/plugins"

# Sublime
mv ~"/Library/Application Support/Sublime Text/Packages/User" ~/.Trash
ln -s "$SYMLINK_LOC/Sublime User Folder/" ~"/Library/Application Support/Sublime Text/Packages/User"

mv ~"/Library/Application Support/Sublime Text/Installed Packages/CSS3.sublime-package" ~/.Trash
ln -s "$SYMLINK_LOC/Sublime Packages/CSS3.sublime-package" ~"/Library/Application Support/Sublime Text/Installed Packages"

mv ~"/Library/Application Support/Sublime Text/Packages/copy-file-name" ~/.Trash
ln -s "$SYMLINK_LOC/Sublime Packages/copy-file-name" ~"/Library/Application Support/Sublime Text/Packages"

# --------------

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

# seperate import plist, explanation https://manytricks.com/osticket/kb/faq.php?id=53
# defaults import com.manytricks.Moom com.manytricks.Moom.plist
# ------------------------------------------------------------------------------

# Symlink Plists
PLIST_SYMLINK_LOC=~'/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/plist/'
cd "$PLIST_SYMLINK_LOC" || exit
for p in *.plist ; do
	mv ~/Library/Preferences/"$p" ~/.Trash
	[[ -e "$p" ]] || break  # handle the case of no *.plist files
	ln -s "$PLIST_SYMLINK_LOC""$p" ~/Library/Preferences/"$f"
done
mv ~/Library/Preferences/org.videolan.vlc/ ~/.Trash
ln -s "$PLIST_SYMLINK_LOC"/org.videolan.vlc/ ~/Library/Preferences/org.videolan.vlc


