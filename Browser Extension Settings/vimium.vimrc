" Closing Tabs
map ww removeTab count=15
map wq closeTabsOnLeft
map we closeTabsOnRight
map W closeOtherTabs
map u removeTab
map U restoreTab

" Scrolling Fast
map J scrollDown count=3
map K scrollUp count=3

" History
map h goBack
map l goForward

" Reload
map R reload hard

" Pages
map H goPrevious
map L goNext

" Tabs
map t Vomnibar.activateTabSelection
map b previousTab
map e nextTab
map < moveTabLeft
map > moveTabRight
map 0 firstTab
map $ lastTab
map <C-2> moveTabToNewWindow

" mimic American keyboard layout
map - enterFindMode

" Marks
" remapping, since backtick isn't properly supported
map ö Marks.activateGotoMode

" Mute Tab
map M toggleMuteTab

" unmap unneeded stuff
unmap d
unmap B
unmap T
unmap o
unmap O
unmap `
unmap <c-e>
unmap <c-y>
unmap /
unmap ^
unmap >>
unmap <<
unmap <a-m>
unmap <a-p>
unmap x
unmap X
unmap g0
unmap g$
