" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" backspace works in normal mode like in insert mode, consistent with <del>
nmap <BS> X

" allows Double Enter to add new line and indent
nmap <CR> A

" more logical
" nmap U CTRL-R
nmap U <C-r>

" s for [s]ubstract
nmap <C-s> <C-d>

" quicker way to change word
nmap <space> ciw

" H and L for moving quicker
nmap H b
nmap L w

" faster scrolling (best used with scroll offset plugin)
nmap J 6j
nmap K 6k

" Y consistent with D and C to the end of line
nmap Y y$

" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings (not here, so they also work in preview mode)

" yank to system clipboard
set clipboard=unnamed

" Quickly remove search highlights
nmap <C-l> :nohl

" link mode (f) like in Vimium
exmap openlink obcommand mrj-jump-to-link:activate-jump-to-link
nmap f :openlink

" close tab
exmap closetab obcommand workspace:close
nmap q :closetab

" quickly escape insert/replace mode
imap jj <Esc>
rmap jj <Esc>

" quicker find mode (mirroring American keyboard layout on German keyboard)
nmap - /
