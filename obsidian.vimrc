""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
set clipboard=unnamed

" show register ~= clipboard history
nmap <C-y> :reg

" Y consistent with D and C to the end of line
nmap Y y$

" always paste what was yanked, not what was deleted
" gets syntax highlighting of comments, but does work though
nmap P "0p

""""""""""""""""""""""
" Search
""""""""""""""""""""""
" search w/o having to press enter
set incsearch

" no modifier key for jumping to next word
nmap + *

" quicker find mode (mirroring American keyboard layout on German keyboard)
nmap - /

" Quickly remove search highlights
nmap _ :nohl

""""""""""""""""""""""
" Nagivation
""""""""""""""""""""""
" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" HJKL behaves like hjkl, but bigger distance (best used with scroll offset plugin)
nmap H (
vmap H (
nmap L )
vmap L )
nmap J 5j
vmap J 5j
nmap K 5k
vmap K 5k

" ß is right to `0`
nmap ß $
vmap ß $

" back/forth
" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings
" (not here, so they also work in preview mode)

""""""""""""""""""""""
" Editing
""""""""""""""""""""""

" backspace works in normal mode like in insert mode, consistent with <del>
nmap <BS> X

" allows Double Enter to add new line and indent
nmap <CR> A

" More logical undo
nmap U <C-r>

" quicker way to change word
nmap <Space> ciw

" switch case (~ not directly available on German keyboards)
nmap ü ~

""""""""""""""""""""""
" Switch Modes
""""""""""""""""""""""

" quickly escape insert mode (and replace mode)
imap jj <Esc>
rmap jj <Esc>

" enter insert mode
vmap i x<Esc>i
