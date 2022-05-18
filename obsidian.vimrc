""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
" set clipboard=unnamed

" show register (i.e., clipboard history)
nmap <C-y> :reg

" Y consistent with D and C to the end of line
nmap Y y$

" paste what was deleted/changed, not what was yanked(gets syntax highlighting of comments, but does work though)
nmap P "0p

" stop polluting the register
" equivalent to nnoremap dd "_dd
exmap deleteline obcommand editor:delete-paragraph
nmap dd :deleteline

""""""""""""""""""""""
" < Search
""""""""""""""""""""""
" search w/o having to press enter
set incsearch
set ignorecase

" no modifier key for jumping to next word
nmap + *

" quicker find mode (by mirroring American keyboard layout on German keyboard layout)
nmap - /

" [M]ute search highlights
nmap M :nohlsearch

""""""""""""""""""""""
" < Nagivation
""""""""""""""""""""""

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
" These seem to be a bit buggy, therefore disabled
" vmap j gj
" vmap k gk

" HJKL behaves like hjkl, but bigger distance (best used with scroll offset plugin)
nmap H ^
vmap H ^
nmap L $
vmap L $
nmap J 6j
nmap K 6k

" no modifier key on German keyboard
nmap , ;

" Hard Mode: Turn off arrow keys for learning
" needs a remap, since unmap does not work on
" builtin keys
nmap <Right> :noop
nmap <Left> :noop
nmap <Up> :noop
nmap <Down> :noop
vmap <Right> :noop
vmap <Left> :noop
vmap <Up> :noop
vmap <Down> :noop

" Goto Mark: remapping since ` not working
nmap ö `

""""""""""""""""""""""
" < Indentation
""""""""""""""""""""""
" <Tab> as indentation is already implemented
" in Obsidian

""""""""""""""""""""""
" < Jumps
""""""""""""""""""""""
" older
nmap ä <C-o>

" newer
nmap Ä <C-i>

""""""""""""""""""""""
" < Editing
""""""""""""""""""""""

" backspace works in normal mode like in insert mode & consistent with <Del>
nmap <BS> h"_x
nmap <S-BS> "_x
vmap <BS> "_d

" don't save small deletion in the register
" can't use "_x, cause Obsidian doesn't support noremap
nmap x "_dl

" allows Double Enter to add new line and indent
nmap <CR> A

" Undo/Redo consistently on one key
map U <C-r>

" Change Word/Selection
nmap <Space> "_ciw
vmap <Space> "vc
" Delete Word/Selection
nmap <S-Space> "_daw
vmap <S-Space> "vdv

" Karabiner: <Fn-Space> = <PageDown>
nmap <PageUp> yiw
" Karabiner: <Fn-Space> = <PageDown>
nmap <PageDown> viwp

" Imitating Abolish's Titlecase (crt)
" also, using u here is more consistent with visual mode
exmap smartcaseswitch obcommand obsidian-smarter-md-hotkeys:smarter-upper-lower
nmap ü :smartcaseswitch
nmap Ü ~h

" Transpose characters, consistent with Emacs/Mac
imap <C-t> <Esc>"_xpi
nmap <C-t> "_xph

" Adding Blank Line above/below
nmap = mzO<Esc>`z
nmap _ mzo<Esc>`z

""""""""""""""""""""""
" < Text Objects
""""""""""""""""""""""
" strangely, nmap works as a substitute for onoremap
" mnemonic: [p]andoc citation syntax
nmap pp i]
" mnemonic: [Z]iting someone
nmap zz i"

""""""""""""""""""""""
" < Comments
""""""""""""""""""""""
" emulate Commentary Plugin
exmap comment obcommand obsidian-smarter-md-hotkeys:smarter-comments
nmap gcc :comment
vmap gc :comment

""""""""""""""""""""""
" < Switch Modes
""""""""""""""""""""""
" Enter Visual from Insert Mode
imap vv <Esc>v

" quick switch to insert mode
imap jj <Esc>
rmap jj <Esc>

" already built in: press v in visual mode to go back
vmap J <Esc>

""""""""""""""""""""""
" < Insert Mode
""""""""""""""""""""""

" mirroring HL in Normal Mode
imap LL <Esc>A
imap HH <Esc>I

" Kill line
imap <C-k> <Esc>C

" Kill line backwards
imap <C-j> <Esc>c^

""""""""""""""""""""""
" < Tab Switching
""""""""""""""""""""""
" Rebuild gt and gT from vim, https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand cycle-through-panes:cycle-through-panes
nmap gt :tabnext
exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
nmap gT :tabprev

""""""""""""""""""""""
" < Tab Folding
""""""""""""""""""""""
" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall
exmap foldall obcommand editor:fold-all
nmap zM :foldall

""""""""""""""""""""""
" < Sneak / Lightspeed
""""""""""""""""""""""
" emulate vim-sneak
exmap sneak obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap s :sneak
nmap S :sneak

""""""""""""""""""""""
" < Sorting
""""""""""""""""""""""
" sort selection
vmap ß :'<,'>sort

" sort [g]lobally
nmap ßg :sort

" sort [p]aragraph
nmap ßp vipß

""""""""""""""""""""""
" < Misc
""""""""""""""""""""""
" help
nmap ? :obcommand

" not available via vim in Obsidian
"set relativenumber

""""""""""""""""""""""""
" < OBSIDIAN LIMITATIONS
""""""""""""""""""""""""
" - text object `is` / `as` does not work https://github.com/codemirror/CodeMirror/issues/5454
" - U (as in changes in a line) does not work
" - https://github.com/codemirror/CodeMirror/blob/master/keymap/vim.js
" - g0 and g$ do no work (even though listed in CodeMirror's vim.js)
" - only `map`s supported, no support for nnoremap, inoremap, etc.
" - `nnoremap` officially supported, but in practice buggy
" - gp not implemented

""""""""""""""""""""""
" < UNUSED KEYS
""""""""""""""""""""""
" Ö X Q Z 0
" § ! & ° ´
