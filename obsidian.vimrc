""""""""""""""""""""""
" < Leader
""""""""""""""""""""""
" let mapleader=,
" can't set leaders in Obsidian vim, so the key just has to be used consistently.
" However, it needs to be unmapped, to not trigger default behavior: https://github.com/esm7/obsidian-vimrc-support#some-help-with-binding-space-chords-doom-and-spacemacs-fans
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
set ignorecase
set smartcase
set incsearch

" no modifier key for jumping to next word
nmap + *

" quicker Find Mode
" (by mirroring American keyboard layout on German keyboard layout)
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
vmap J 6j
nmap K 6k
vmap K 6k

" Navigate headings, requires Code Editor Shortcuts plugin
exmap nextHeading obcommand obsidian-editor-shortcuts:goToNextHeading
exmap prevHeading obcommand obsidian-editor-shortcuts:goToPrevHeading
nmap <C-j> :nextHeading
nmap <C-k> :prevHeading

" Navigating Pane History done via Obsdian Hotkeys, so they also work
" in Preview Mode
" exmap back obcommand app:go-back
" nmap <C-h> :back
" exmap forward obcommand app:go-forward
" nmap <C-l> :forward

" Hard Mode: Turn off arrow keys for learning
" (needs remap, since unmap does not work on built-in keys)
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

""""""""""""""""""""""
" < g commands
""""""""""""""""""""""

" [g]oto [d]efiniton ~= footnotes
" requires Footnotes Shortcut Plugin
exmap gotoFootnoteDefinition obcommand obsidian-footnotes:insert-footnote
nmap gd :gotoFootnoteDefinition

" [g]oto [s]ymbol
" requires Another Quick Switcher Plugin
exmap gotoHeading obcommand obsidian-another-quick-switcher:header-search-in-file
nmap gs :gotoHeading
vmap gs :gotoHeading

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
nmap gf :followLinkUnderCursor
vmap gf :followLinkUnderCursor

" [g]oto [o]pen file (= Quick Switcher)
exmap quickSwitcher obcommand obsidian-another-quick-switcher:filename-recent-search
nmap go :quickSwitcher
vmap go :quickSwitcher

""""""""""""""""""""""
" < Indentation
""""""""""""""""""""""
" Tab as indentation is already implemented in Obsidian

""""""""""""""""""""""
" < Editing
""""""""""""""""""""""

" [M]erge Lines
" can't remap to J, cause there is no noremap, also the merge from Code Editor
" Shortcuts plugin is smarter than J
exmap mergeLines obcommand obsidian-editor-shortcuts:joinLines
nmap M :mergeLines
vmap M :mergeLines

" backspace works in normal mode like in insert mode
nmap <BS> h"_x
vmap <BS> "_d

" don't save small deletion in the register
" can't use "_x, cause Obsidian doesn't support noremap
nmap x "_dl
nmap cl "_dli

" allows Double Enter to add new line and indent with bullet points
nmap <CR> A

" Undo/Redo consistently on one key
nmap U <C-r>
vmap U <C-r>

" Case Switch, (h to enable vertical navigation afterwards)
nmap Ü ~h
" Case Switch via Smarter MD Hotkeys Plugin
exmap caseSwitch obcommand obsidian-smarter-md-hotkeys:smarter-upper-lower
nmap ü :caseSwitch
" to CapitalCase without the plugin, use: nmap Ü mzlblgueh~`z
vmap ü :caseSwitch

" Transpose current & next char
" (can't use x, cause it sends to black hole registry, due to missing noremap)
imap <C-t> <Esc>dlpi
nmap ä dlp

" Transpose current & next word
nmap Ä dawelpb

" Add Blank Line above/below
nmap = mzO<Esc>`z
nmap _ mzo<Esc>`z

" Remove Line above/below
nmap ,0 mzk"_dd`z
nmap ,- mzj"_dd`z

" Add ,;.": to end of line
" `&§&` are helper commands for addings substitution to command chain,
" `A;<Esc>` does not work as insert mode mappings aren't remembered
nmap &§&. :.s/$/./
nmap &§&, :.s/$/,/
nmap &§&; :.s/$/;/
nmap &§&" :.s/$/"/
nmap &§&: :.s/$/:/
nmap &§&) :.s/$/)/
nmap &§&] :.s/$/]/
nmap ,. mz&§&.`z
nmap ,, mz&§&,`z
nmap ,; mz&§&;`z
nmap ," mz&§&"`z
nmap ,: mz&§&:`z
nmap ,) mz&§&)`z
nmap ,] mz&§&]`z

" Remove last character from line
nmap X mz$"_x`z

" commentary.vim emulation
nmap gcc :.s/^|$/%%/g

" turn bolded bullet points to h2
" has to be done this complicated way cause vim substitutes called in maps can't
" properly process spaces
nmap &§&#a :.s/\*\*//g
nmap &§&#b :.s/^-/##/
nmap ,# mz&§&#a&§&#bO<Esc>`z

""""""""""""""""""""""
" < Text Objects
""""""""""""""""""""""

" Change Word/Selection
nmap <Space> "_ciw
vmap <Space> "vc

" Delete Word/Selection
nmap <S-Space> "_daw
vmap <S-Space> "vd

" Yank Word/Selection
" Alt-Space mapped to <S-F12> via Karabiner Elements due to Obsidian
" interpreting it as non-breaking space
nmap <S-F12> yiw
vmap <S-F12> y

" [R]eplace Word with register content
nmap R viw"0p
vmap R "0P

" `vas` emulation, https://github.com/codemirror/CodeMirror/issues/5454
nmap S v(o)h

""""""""""""""""""""""
" < Switch Modes
""""""""""""""""""""""
" Enter Visual from Insert Mode
imap vv <Esc>v
imap VV <Esc>V

" quick switch to insert mode
imap jj <Esc>

""""""""""""""""""""""
" < Insert Mode
""""""""""""""""""""""

" mirroring HL in Normal Mode
imap HH <Esc>I
imap LL <Esc>A

" Kill line
imap <C-k> <Esc>lC

" Kill line backwards
imap <C-j> <Esc>c^

""""""""""""""""""""""
" < Tabs/Window
""""""""""""""""""""""

" https://vimhelp.org/index.txt.html#CTRL-W
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

exmap only obcommand workspace:close-others
nmap <C-w>o :only
exmap close obcommand workspace:close
nmap <C-w>q :close
nmap <C-w>c :close

" Original gt and gT https://vimhelp.org/tabpage.txt.html#gt
" requires Pane Relief Plugin
exmap nextPane obcommand pane-relief:go-next
exmap prevPane obcommand pane-relief:go-prev
nmap gt :nextPane
nmap gT :prevPane

" Cycle Window (Original Vim Bindings)
nmap <C-w><C-w> :nextPane
nmap <C-w>w :nextPane

" [g]oto next [w]indow (in Obsidian essentially the same as gt)
nmap gw :nextPane
vmap gw :nextPane

" swap pane position (Original Vim Bindings)
" requires Pane Relief Plugin
exmap swapPane obcommand pane-relief:swap-next
exmap movePaneToFarLeft obcommand pane-relief:put-1st
exmap movePaneToFarRight obcommand pane-relief:put-last
nmap <C-w>x :swapPane
vmap <C-w>x :swapPane
nmap <C-w>H :movePaneToFarLeft
vmap <C-w>H :movePaneToFarLeft
nmap <C-w>L :movePaneToFarRight
vmap <C-w>L :movePaneToFarRight

""""""""""""""""""""""
" < Folding
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

" more folding things available when using the Creases plugin
" https://discord.com/channels/686053708261228577/716028884885307432/979141099878760449
" exmap foldCurrent obcommand creases:increase-fold-level-at-cursor
" exmap unfoldCurrent obcommand creases:decrease-fold-level-at-cursor
" exmap increaseFolding obcommand creases:decrease-fold-level
" exmap reduceFolding obcommand creases:increase-fold-level
" nmap zc :foldCurrent
" nmap zo :unfoldCurrent
" nmap zm :increaseFolding
" nmap zr :reduceFolding

""""""""""""""""""""""
" < Sneak
""""""""""""""""""""""
" emulate vim-sneak (somewhat)
exmap sneak obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap s :sneak

" essentially vimium's f command
exmap followLink obcommand mrj-jump-to-link:activate-jump-to-link
nmap ,f :followLink

""""""""""""""""""""""
" < Formatting
""""""""""""""""""""""
" Semantic Line Breaks formatting instead text-width, cause it's the 21st century
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
" < Obsidian Limitations
""""""""""""""""""""""""
" - text object `is` / `as` does not work https://github.com/codemirror/CodeMirror/issues/5454
" - U (as in changes in a line) does not work
" - https://github.com/codemirror/CodeMirror/blob/master/keymap/vim.js
" - g0 and g$ do no work (even though listed in CodeMirror's vim.js)
" - only `map` supported, no support for nnoremap, inoremap, etc.
" - `nnoremap` officially supported, but in practice buggy
" - gp not implemented

""""""""""""""""""""""
" < unused keys
""""""""""""""""""""""
" Ö § ! & ° Q ? |
" rarely used: 0 # Z
" Special: <BS>, <Right>, <Left>, <Up>, <Down>, <End>
" maybe <Ins>/<Insert>?
" remap <Esc> to F17?
