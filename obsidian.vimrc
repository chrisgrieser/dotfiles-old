""""""""""""""""""""""
" < Leader
""""""""""""""""""""""
" let mapleader=,
" can't set leaders in Obsidian vim, so the
" leader key is simply used consistently here
" however, needs to be unmapped, to not trigger
" default behavior: https://github.com/esm7/obsidian-vimrc-support#some-help-with-binding-space-chords-doom-and-spacemacs-fans
unmap ,

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
set ignorecase
set smartcase
set incsearch
set hlsearch

" no modifier key for jumping to next word
nmap + *

" quicker find mode (by mirroring American keyboard layout on German keyboard layout)
nmap - /

" [M]ute search highlights
nmap <C-m> :nohlsearch

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

" Goto Mark
nmap ö `

" goto definiton ~= footnotes
exmap gotoFootnoteDefinition obcommand obsidian-footnotes:insert-footnote
nmap gd :gotoFootnoteDefinition

" [g]oto [s]ymbol
exmap gotoHeading obcommand obsidian-another-quick-switcher:header-search-in-file
nmap gs :gotoHeading

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
nmap gf :followLinkUnderCursor

" [g]oto [o]pen file (= Quick Switcher)
exmap quickSwitcher obcommand obsidian-another-quick-switcher:filename-recent-search
nmap go :quickSwitcher

""""""""""""""""""""""
" < Indentation
""""""""""""""""""""""
" Tab as indentation is already implemented in Obsidian

""""""""""""""""""""""
" < Editing
""""""""""""""""""""""

" [M]erge lines
" can't remap to J, cause there is no noremap :/
exmap mergelines obcommand obsidian-editor-shortcuts:joinLines
nmap M :mergelines
vmap M :mergelines

" backspace works in normal mode like in insert mode & consistent with <Del>
nmap <BS> h"_x
vmap <BS> "_d

" don't save small deletion in the register
" can't use "_x, cause Obsidian doesn't support noremap
nmap x "_dl

" allows Double Enter to add new line and indent with bullet points
nmap <CR> A

" Undo/Redo consistently on one key
map U <C-r>

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
nmap ,. mz&§&.`z
nmap ,, mz&§&,`z
nmap ,; mz&§&;`z
nmap ," mz&§&"`z
nmap ,: mz&§&:`z

" Remove last character from line
nmap X mz$"_x`z

""""""""""""""""""""""
" < Text Objects
""""""""""""""""""""""
" mnemonic: [Q]uotation Marks
nmap Q ci"

" Change Word/Selection
nmap <Space> "_ciw
vmap <Space> "vc
" Delete Word/Selection
nmap <S-Space> "_daW
vmap <S-Space> "vd

" Replace Word with register content
" Alt-Space mapped to <S-F12> due to Obsidian interpreting it as non-breaking space
nmap <S-F12> viwp
vmap <S-F12> p

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
" < Tabs/Window
""""""""""""""""""""""
" Rebuild gt and gT from vim, https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand cycle-through-panes:cycle-through-panes
nmap gt :tabnext
exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
nmap gT :tabprev

exmap focusRight obcommand editor:focus-right
nmap <C-w>l :focusRight
exmap focusLeft obcommand editor:focus-left
nmap <C-w>h :focusLeft
exmap focusTop obcommand editor:focus-top
nmap <C-w>k :focusTop
exmap focusBottom obcommand editor:focus-bottom
nmap <C-w>j :focusBottom

exmap splitVertical obcommand workspace:split-vertical
nmap <C-w>v :splitVertical
exmap splitHorizontal obcommand workspace:split-horizontal
nmap <C-w>s :splitHorizontal

exmap onlyThisWindow obcommand workspace:close-others
nmap <C-w>o :onlyThisWindow
exmap closeThisWindow obcommand workspace:close
nmap <C-w>q :closeThisWindow
exmap closeThisWindow obcommand workspace:close
nmap <C-w>c :closeThisWindow

""""""""""""""""""""""
" < Folding
""""""""""""""""""""""
" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall
exmap foldall obcommand editor:fold-all
nmap zM :foldall

" more folding things available when using the "Creases" plugin
" https://discord.com/channels/686053708261228577/716028884885307432/979141099878760449

""""""""""""""""""""""
" < Sneak
""""""""""""""""""""""
" emulate vim-sneak
exmap sneak obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap s :sneak
nmap S :sneak

" essentially vimium's f command
exmap followLink obcommand mrj-jump-to-link:activate-jump-to-link
nmap ,f :followLink

""""""""""""""""""""""
" < Formatting
""""""""""""""""""""""
" Use Semantic Line Breaks for formatting
exmap sembr obcommand obsidian-sembr:toggle-sem-br
nmap gq :sembr

""""""""""""""""""""""
" < Sorting
""""""""""""""""""""""
" [s]ort [s]election
vmap ,ss :'<,'>sort

" [s]ort [g]lobally
nmap ,sg :sort

" [s]ort [p]aragraph
nmap ,sp vip,ss

""""""""""""""""""""""
" < Misc
""""""""""""""""""""""
" help
nmap ? :obcommand

""""""""""""""""""""""""
" < OBSIDIAN LIMITATIONS
""""""""""""""""""""""""
" - text object `is` / `as` does not work https://github.com/codemirror/CodeMirror/issues/5454
" - U (as in changes in a line) does not work
" - https://github.com/codemirror/CodeMirror/blob/master/keymap/vim.js
" - g0 and g$ do no work (even though listed in CodeMirror's vim.js)
" - only `map` supported, no support for nnoremap, inoremap, etc.
" - `nnoremap` officially supported, but in practice buggy
" - gp not implemented

""""""""""""""""""""""
" < UNUSED KEYS
""""""""""""""""""""""
" Ö § ! & °
" rarely used: 0 # R Z
" Special: <BS>, <Right>, <Left>, <Up>, <Down>, <End>
" maybe <Ins>/<Insert>?
" remap <Esc> to F17?
