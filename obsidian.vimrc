""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
" set clipboard=unnamed

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

" HJKL behaves like hjkl, but bigger distance (best used with scroll offset plugin)
nmap H ^
vmap H ^
nmap L $
vmap L $
nmap J 6j
vmap J 6j
nmap K 6k
vmap K 6k

" back/forth
" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings
" (not mapped here, so they also work in preview mode)

""""""""""""""""""""""
" Editing
""""""""""""""""""""""

" backspace works in normal mode like in insert mode & consistent with <del>
nmap <BS> hx

" allows Double Enter to add new line and indent
nmap <CR> A

" More logical undo
nmap U <C-r>

" quicker way to change word
nmap <Space> ciw
nmap <S-Space> daw
vmap <Space> c

" switch case (~ not directly available on German keyboards)
nmap ü ~

" fix text object `is` not working
" since noremap is not supported in Obsidian, 'nmap cis (c)' to avoid recursion does not work
nmap X (c)

" transpose characters, consistent with Emacs/Mac
imap <C-t> <Esc>xpi
nmap <C-t> xph

""""""""""""""""""""""
" Text Objects
""""""""""""""""""""""
" (actually works with nmap instead of onoremap here)

"pseudo-map 56 to [] ( [] not working + no more modifier key)
nmap i5 i[
nmap i6 i]
nmap a5 a[
nmap a6 a]

"pseudo-map 89 to () (= no modifier key needed anymore)
nmap i8 i(
nmap i9 i)
nmap a8 a(
nmap a9 a)

"pseudo-map 2 to " (= no modifier key needed anymore)
nmap i2 i"
nmap a2 a"

""""""""""""""""""""""
" Switch Modes
""""""""""""""""""""""

" quick switch to insert mode
imap jj <Esc>
rmap jj <Esc>
" already built in: presss v in visual mode to go back

" quick switch to visual mode
imap vv <Esc>v

" quick switch to insert mode
vmap ii <Esc>i

""""""""""""""""""""""
" Insert Mode
""""""""""""""""""""""

" mirroring HL in Normal Mode
imap LL <Esc>A
imap HH <Esc>I

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
" Folding
""""""""""""""""""""""

" Rebuild zo, zc, zn from vim, https://vimhelp.org/tabpage.txt.html#gt
exmap fold obcommand editor:toggle-fold
nmap zo :fold
nmap zc :fold

exmap unfoldall obcommand editor:unfold-all
nmap zn :unfoldall

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
" Limiations
""""""""""""""""""""""

" OBSIDIAN LIMITATIONS
" text object `is` / `as` does not work
" U (as in changes in a line) does not work
" https://github.com/codemirror/CodeMirror/blob/master/keymap/vim.js
" g0 and g$ do no work (even though listed in CodeMirror's vim.js)
" noremap not supported

" LIMITATIONS DUE TO GERMAN KEYBOARD / MAC
" all keys that require pressing alt/opt to be created (e.g. [ or @) and
" all keys requiring a follow-up key (^`´) are also not working
" however, using workaround via Karabiner elements:
