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
set scrolloff=10

" Ignore capital letters during search. (already active in Obsidian vim)
set ignorecase

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch
