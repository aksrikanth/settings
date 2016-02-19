" Set the guifont
if has("gui_gtk2")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 16
elseif has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
elseif has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif

" Use console dialogs instead of popups
set guioptions+=c

" Turn off useless toolbar
set guioptions-=T

" Turn off right-hand scroll-bar
set guioptions-=r
set guioptions-=R

" Turn off left-hand scroll-bar
set guioptions-=l
set guioptions-=L

" Turn off bottom scroll-bar
set guioptions-=b

" Turn off menu bar (toggle with CTRL+F11)
set guioptions-=m

" Turn off visual bell
set visualbell t_vb=
" vim:filetype=vim
