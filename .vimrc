" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

" disable vi compatibility
set nocompatible

syntax on
set nowrap
set number
set relativenumber
set cursorline
set scrolloff=7

" vertical ruler
set colorcolumn=80
" mostly used by `gq`
set textwidth=80

set tabstop=3
set softtabstop=3
set shiftwidth=3
set smartindent
" Gutter for LSP or linters
" set signcolumn

" Show the mode you are on the last line.
set showmode
" show partial chord in the last line
set showcmd

" search options
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch

" Trim Whitespace on Save
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-plug
" call plug#begin('~/.vim/plugged')

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'

" " PLUGINS TO ADD
" " unimpaired
" " surround
" " commantary
" " sneak
" " highlightedyank

" call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""
" Basics
""""""""""""""""""""""

let mapleader=,

" cmd+s to save
nnoremap <D-s> :write<CR>
" cmd+a to save all
nnoremap <D-a> ggvG
" cmd+w to save&quit
nnoremap <D-w> ZQ
" Swap up/down (vim.unimpaired)
noremap <D-2> [e
noremap <D-3> ]e

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
" no modifier key for jumping to next word
nnoremap + *

" quicker find mode (by mirroring American keyboard layout on German keyboard layout)
nnoremap - /

" Quickly remove search highlights
nnoremap <C-m> :nohlsearch<CR>

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
