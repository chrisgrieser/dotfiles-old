""""""""""""""""""""""
" < Leader
""""""""""""""""""""""
" let mapleader=ß
" can't set leaders in Obsidian vim, so the
" leaderkey is simply used consistently here

""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
set clipboard=unnamed

" show register (i.e., clipboard history)
map <C-y> :reg
imap <C-y> :reg

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

" [M]ute search highlights
nmap M :nohlsearch

""""""""""""""""""""""
" < Nagivation
""""""""""""""""""""""

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
vmap j gj
vmap k gk

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
nmap <Right> <Nop>
nmap <Left> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>
vmap <Right> <Nop>
vmap <Left> <Nop>
vmap <Up> <Nop>
vmap <Down> <Nop>

" Goto Mark: remapping since ` not working
nmap ö `

""""""""""""""""""""""
" < Indentation
""""""""""""""""""""""
" <Tab> as indentation is already implemented
" in Obsidian

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
nmap <S-Space> "_daW
vmap <S-Space> "vd

" Yank Word/Selection
" <A-Space> mapped to <S-F12> due to Obsidian interpreting it as non-breaking space
nmap <S-F12> yiw
vmap <S-F12> "vy

" Case Switch
nmap ü ~h
" Case Switch Plugin
exmap caseswitch obcommand obsidian-smarter-md-hotkeys:smarter-upper-lower
nmap Ü :caseswitch

" Transpose current & next char
" (can't use x, cause it sends to black hole registry)
imap <C-t> <Esc>dlpi
nmap ä dlp

" Transpose current & next word
nmap Ä dawelpb

" Adding Blank Line above/below
nmap = mzO<Esc>`z
nmap _ mzo<Esc>`z

" Add ,;.": to end of line
" `&§&` are helper commands for addings substitution to command chain,
" `A;<Esc>` does not work as insert mode mappings aren't remembered
nmap &§&. :.s/$/./
nmap &§&, :.s/$/,/
nmap &§&; :.s/$/;/
nmap &§&" :.s/$/"/
nmap &§&: :.s/$/:/
nmap ß. mz&§&.`z
nmap ß, mz&§&,`z
nmap ß; mz&§&;`z
nmap ß" mz&§&"`z
nmap ß: mz&§&:`z
" Remove last character from line
nmap X mz$"_x`z

""""""""""""""""""""""
" < Text Objects
""""""""""""""""""""""
" mnemonic: [z]itation [z]yntax
nmap zz i]

""""""""""""""""""""""
" < Switch Modes
""""""""""""""""""""""
" Enter Visual from Insert Mode
imap vv <Esc>v
imap VV <Esc>V

" quick switch to insert mode
imap jj <Esc>
rmap jj <Esc>

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
""""""""""""""""""""""
" < Sorting
""""""""""""""""""""""
" [s]ort [s]election
vmap ßss :'<,'>sort

" [s]ort [g]lobally
nmap ßsg :sort

" [s]ort [p]aragraph
nmap ßsp vipß

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
" Ö X Q Z
" § ! & ° ´
" rarely used: 0 #
" <BS>, <Right>, <Left>, <Up>, <Down>, <End>
" functioniert <Ins>/<Insert> ?
" Esc-key zu F17 remappen?
