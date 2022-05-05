""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""
" yank to system clipboard
set clipboard=unnamed

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
nmap H ^
vmap H ^
nmap L $
vmap L $
nmap J 5j
vmap J 5j
nmap K 5k
vmap K 5k

" ß is on the right of `0` in German keyboards
nmap ß $
vmap ß $

" back/forth
" ctrl+h and ctrl+l are mapped as back/forth in Obsidian's hotkeys settings
" (not mapped here, so they also work in preview mode)

" next heading/previous heading
" (not mapped in Obsidian hotkeys, so ctrl + k is left as kill line in insert mode)
exmap nextHeading obcommand obsidian-editor-shortcuts:goToNextHeading
nmap <C-j> :nextHeading
exmap prevHeading obcommand obsidian-editor-shortcuts:goToPrevHeading
nmap <C-k> :prevHeading

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
nmap <S-Space> caw
vmap <Space> c

" makes X an amplified x
nmap X daw

" switch case (~ not directly available on German keyboards)
nmap ü ~

" fix text object `is` not working
" since noremap is not supported in Obsidian, 'nmap cis (c)' to avoid recursion does not work
nmap s (c)

""""""""""""""""""""""
" Switch Modes
""""""""""""""""""""""

" quickly escape insert mode (or replace mode)
imap jj <Esc>
rmap jj <Esc>

" quickly switch to visual mode
imap vv <Esc>v

" quickly switch to insert mode
vmap ii <Esc>i

""""""""""""""""""""""
" Text Objects
""""""""""""""""""""""

"pseudo-map 0ß to [] ( [] not working + no more modifier key)
nmap i0 i[
nmap iß i]
nmap a0 a[
nmap aß a]
nmap f0 f[
nmap fß f]
nmap t0 t[
nmap tß t]

"pseudo-map 89 to () (= no modifier key needed anymore)
nmap i8 i(
nmap i9 i)
nmap a8 a(
nmap a9 a)
nmap f8 f(
nmap f9 f)
nmap t8 t(
nmap t9 t)

""""""""""""""""""""""
" Misc
""""""""""""""""""""""
" quicker access to Obsidian command-ids
nmap ? :obcommand

" Play Macro: more consistent mapping (and @ not working)
nmap Q @

" Goto Marks: remapping sinc ` not working
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
