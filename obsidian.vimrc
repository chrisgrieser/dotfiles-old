""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
set clipboard=unnamed

" show register (i.e., clipboard history)
nmap <C-y> :reg

" Y consistent with D and C to the end of line
nmap Y y$

" always paste what was yanked (y), not what was deleted (d or c)
" (gets syntax highlighting of comments, but does work though)
nmap P "0p

""""""""""""""""""""""
" Search
""""""""""""""""""""""
" search w/o having to press enter
set incsearch

" no modifier key for jumping to next word
nmap + *

" quicker find mode (by mirroring American keyboard layout on German keyboard layout)
nmap - /

" Quickly remove search highlights
nmap _ :nohlsearch

""""""""""""""""""""""
" Nagivation
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

""""""""""""""""""""""
" Jumps
""""""""""""""""""""""
" older
nmap <Tab> <C-o>

" newer
nmap <S-Tab> <C-i>

""""""""""""""""""""""
" Editing
""""""""""""""""""""""

" backspace works in normal mode like in insert mode & consistent with <del>
nmap <BS> hx
vmap <BS> xh

" allows Double Enter to add new line and indent
nmap <CR> A

" More logical undo
nmap U <C-r>

" quicker way to change word
nmap <Space> ciw
nmap <S-Space> daw
vmap <Space> c

" Imitating Abolish's Titlecase (crt)
exmap smartcaseswitch obcommand obsidian-smarter-md-hotkeys:smarter-upper-lower
nmap ä :smartcaseswitch
nmap Ä ~

" transpose characters, consistent with Emacs/Mac
imap <C-t> <Esc>xpi
nmap <C-t> xph

""""""""""""""""""""""
" Text Objects
""""""""""""""""""""""

" (actually works with nmap instead of onoremap here)
nmap pp i(
nmap vv i[
nmap qq i"

" fix text object `is` not working
" since noremap is not supported in Obsidian, 'nmap cis (c)' to avoid recursion does not work
nmap X (c)

""""""""""""""""""""""
" Switch Modes
""""""""""""""""""""""

" quick switch to insert mode
imap jj <Esc>
rmap jj <Esc>

" already built in: presss v in visual mode to go back
vmap J <Esc>

""""""""""""""""""""""
" Insert Mode
""""""""""""""""""""""

" mirroring HL in Normal Mode
imap <C-l> <Esc>A
imap <C-h> <Esc>I

" Kill line
imap <C-k> <Esc>C

" Kill line backwards
imap <C-j> <Esc>c^

""""""""""""""""""""""
" Tab Switching
""""""""""""""""""""""
" Rebuild gt and gT from vim, https://vimhelp.org/tabpage.txt.html#gt
exmap tabnext obcommand cycle-through-panes:cycle-through-panes
nmap gt :tabnext
exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
nmap gT :tabprev

""""""""""""""""""""""
" Sneak / Lightspeed
""""""""""""""""""""""
" emulate vim-sneak
exmap sneak obcommand activate-jump-to-anywhere
nmap s :sneak

""""""""""""""""""""""
" Folding
""""""""""""""""""""""
" Rebuild some folding from vim, https://vimhelp.org/tabpage.txt.html#gt
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

""""""""""""""""""""""
" Misc
""""""""""""""""""""""
" quicker access to Obsidian command-ids
nmap ? :obcommand

" Play Macro: more consistent mapping (and @ not working)
nmap Q @

" Goto Mark: remapping since ` not working
nmap ö `

""""""""""""""""""""""
" OBSIDIAN LIMITATIONS
""""""""""""""""""""""
" - text object `is` / `as` does not work
" - U (as in changes in a line) does not work
" - https://github.com/codemirror/CodeMirror/blob/master/keymap/vim.js
" - g0 and g$ do no work (even though listed in CodeMirror's vim.js)
" - only `map`s supported, no support for nnoremap, inoremap, etc.
" - `nnoremap` officially supported, but in practice buggy
" - gp not implemented
