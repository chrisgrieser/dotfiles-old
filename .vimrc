" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" disable vi compatibility
set nocompatible

" Turn syntax highlighting on.
syntax on

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set tab width to 3 columns.
set tabstop=3

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=7

" Show the mode you are on the last line.
set showmode

" show partial chord in the last line
set showcmd

" Show matching words during a search.
set showmatch

" search options
set ignorecase
set smartcase
set incsearch
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
set clipboard=unnamed

" show register (i.e., clipboard history)
nnoremap <C-y> :reg<CR>

" Y consistent with D and C to the end of line
nnoremap Y y$

" always paste what was yanked (y), not what was deleted (d or c)
" (gets syntax highlighting of comments, but does work though)
nnoremap P "0p

""""""""""""""""""""""
" Search
""""""""""""""""""""""
" search w/o having to press enter
set incsearch

set ignorecase

" no modifier key for jumping to next word
nnoremap + *

" quicker find mode (by mirroring American keyboard layout on German keyboard layout)
nnoremap - /

" Quickly remove search highlights
nnoremap _ :nohlsearch<CR>

""""""""""""""""""""""
" Editing
""""""""""""""""""""""

" backspace works in normal mode like in insert mode & consistent with <del>
nnoremap <BS> X
vnoremap <BS> xh

" allows Double Enter to add new line and indent
nnoremap <CR> A

" More logical undo
nnoremap U <C-r>

" quicker way to change word
nnoremap <Space> ciw
nnoremap <S-Space> daw
vnoremap <Space> c

" Abolish: Titlecase
nnoremap ä crt
nnoremap Ä ~

" transpose characters, consistent with Emacs/Mac
" transpose characters, consistent with Emacs/Mac
inoremap <C-t> <Esc>xpi
nnoremap <C-t> xph

""""""""""""""""""""""
" Text Objects
""""""""""""""""""""""

" double [] for symmetry with Obsidian's Vim Emulation
onoremap zz i[


""""""""""""""""""""""
" Switch Modes
""""""""""""""""""""""

" quick switch to insert mode
inoremap jj <Esc>

" already built in: presss v in visual mode to go back
vnoremap J <Esc>

""""""""""""""""""""""
" Insert Mode
""""""""""""""""""""""

" mirroring HL in Normal Mode
inoremap <C-l> <Esc>A
inoremap <C-h> <Esc>I

" Kill line
inoremap <C-k> <Esc>C

" Kill line backwards
inoremap <C-j> <Esc>c^

""""""""""""""""""""""
" Misc
""""""""""""""""""""""
" quicker access to help command-ids
nnoremap ? :help

" Goto Mark: remapping since ` not working
nnoremap ö `
