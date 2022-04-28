" yank to system clipboard
set clipboard=unnamed

" register ~= clipboard history
nmap <C-y> :reg

" always paste what was yanked, not what was deleted
nmap P "0p

" search w/o having to press enter
set incsearch

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" backspace works in normal mode like in insert mode, consistent with <del>
nmap <BS> X

" allows Double Enter to add new line and indent
nmap <CR> A

" More logical undo
nmap U <C-r>

" quicker way to change word
nmap <Space> ciw

" no modifier key for jumping to next word
nmap + *

" switch case
nmap ü ~

" HJKL behaves like hjkl, but bigger distance (best used with scroll offset plugin)
nmap H b
nmap L w
nmap J 6j
nmap K 6k
vmap H b
vmap L w
vmap J 6j
vmap K 6k

" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings (not here, so they also work in preview mode)
" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings (not here, so they also work in preview mode)

" Y consistent with D and C to the end of line
nmap Y y$

" Quickly remove search highlights
nmap ? :nohl

" close tab
exmap closetab obcommand workspace:close
nmap q :closetab

" quickly escape insert mode (and replace mode)
imap jj <Esc>
rmap jj <Esc>

" enter insert mode
vmap i x<Esc>i

" quicker find mode (mirroring American keyboard layout on German keyboard)
nmap - /
