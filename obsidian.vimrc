" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" backspace works in normal mode
nmap <BS> hx

" allows Double Enter to add new line and indent
nmap <CR> A

" H and L for beginning/end of line
nmap H ^
nmap L $

" faster scrolling (best used with scroll offset plugin)
nmap J 6j
nmap K 6k

" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings (not here, so they also work in preview mode)

" yank to system clipboard
set clipboard=unnamed

" link mode (f) as in Vimium
exmap openlink obcommand mrj-jump-to-link:activate-jump-to-link
nmap f :openlink

" close tab
exmap closetab obcommand workspace:close
nmap q :closetab

" quickly escape insert mode
imap jj <Esc>

" quicker find mode (mirroring American keyboard layout on German keyboard)
nmap - /
