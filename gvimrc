" Do some Themeing stuff if gui is available
set go-=T
set antialias
set linespace=2
exec "set guifont=" . myFont
exec "set background=" . myBg
set transparency=0
" Do not use modal alert dialogs! (Prefer Vim style prompt.)
" http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
set guioptions+=C

" set fullscreen on startup
au GUIEnter * set fullscreen
