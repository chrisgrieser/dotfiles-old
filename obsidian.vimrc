""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
set clipboard=unnamed

" show register (i.e., clipboard history)
nmap <C-y> :reg

" Y consistent with D and C to the end of line
nmap Y y$

" paste what was deleted/changed, not what was yanked(gets syntax highlighting of comments, but does work though)
nmap P "0p

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

" Quickly remove search highlights
nmap _ :nohlsearch

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
" < Jumps
""""""""""""""""""""""
" older
nmap <Tab> <C-o>

" newer
nmap <S-Tab> <C-i>

""""""""""""""""""""""
" < Editing
""""""""""""""""""""""

" backspace works in normal mode like in insert mode & consistent with <Del>
nmap <BS> h"_x
vmap <BS> d
nmap <S-BS> "_x

" don't save small deletion in the register
" can't use "_x, cause Obsidian doesn't support noremap
nmap x "_dl

" allows Double Enter to add new line and indent
nmap <CR> A

" More logical undo
nmap U <C-r>

" quicker way to change word
nmap <Space> "_ciw
nmap <S-Space> "_daw
vmap <Space> "_c
" opt + space = <PageUp> via Karabiner elements
nmap <PageUp> yiw
" fn + space = <PageDown> via Karabiner elements
nmap <PageDown> viwp

" Imitating Abolish's Titlecase (crt)
exmap smartcaseswitch obcommand obsidian-smarter-md-hotkeys:smarter-upper-lower
nmap ü :smartcaseswitch
nmap Ü ~

" transpose characters, consistent with Emacs/Mac
imap <C-t> <Esc>"_xpi
nmap <C-t> "_xph

""""""""""""""""""""""
" < Text Objects
""""""""""""""""""""""

" fix text object `is` not working
" since noremap is not supported in Obsidian, 'nmap cis (c)' to avoid recursion does not work
nmap X (c)

" mnemonic: [p]andoc citation syntax
" strangely, nmap works as a substitute for onoremap
nmap pp i]


""""""""""""""""""""""
" < Switch Modes
""""""""""""""""""""""

" quick switch to insert mode
imap jj <Esc>
rmap jj <Esc>

" already built in: presss v in visual mode to go back
vmap J <Esc>

""""""""""""""""""""""
" < Insert Mode
""""""""""""""""""""""

" mirroring HL in Normal Mode
imap <C-l> <Esc>A
imap <C-h> <Esc>I

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
" < Folding
""""""""""""""""""""""
" Rebuild some folding from vim, https://vimhelp.org/fold.txt.html#fold-commands
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
exmap sneak obcommand activate-jump-to-anywhere
nmap s :sneak
nmap S :sneak


""""""""""""""""""""""
" < Footpedal
""""""""""""""""""""""
" Karabiner maps pedal to <Del>
nmap <Del> i
vmap <Del> <Esc>
imap <Del> <Esc>
rmap <Del> <Esc>

""""""""""""""""""""""
" < Sorting
""""""""""""""""""""""
" sort selection
vmap ß :'<,'>sort

" sort globally
nmap ßg :sort

" paragraph-wise sorting unfortunately does not work :(

""""""""""""""""""""""
" < Misc
""""""""""""""""""""""
" quicker access to Obsidian command-ids
nmap ? :obcommand

""""""""""""""""""""""""
" < OBSIDIAN LIMITATIONS
""""""""""""""""""""""""
" - text object `is` / `as` does not work
" - U (as in changes in a line) does not work
" - https://github.com/codemirror/CodeMirror/blob/master/keymap/vim.js
" - g0 and g$ do no work (even though listed in CodeMirror's vim.js)
" - only `map`s supported, no support for nnoremap, inoremap, etc.
" - `nnoremap` officially supported, but in practice buggy
" - gp not implemented

""""""""""""""""""""""
" < UNUSED KEYS
""""""""""""""""""""""
" ä Ä Ö Q = § ! & M °
