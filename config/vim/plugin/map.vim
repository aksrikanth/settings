if exists("DidMap")
  finish
endif

let DidMap = 1

let s:cpo_save=&cpo
set cpo&vim
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>

map! <C-e> <esc>

" Improve home key behavior
function! s:SmartHome()
  " this line checks if we are not on the first whitespace.
  if col('.') != match(getline('.'), '\S')+1
    norm ^
  else
    norm 0
  endif
endfun

inoremap <silent><home> <C-O>:call <SID>SmartHome()<CR>
nnoremap <silent><home> :call <SID>SmartHome()<CR>
vnoremap <silent><home> :call <SID>SmartHome()<CR>
inoremap <C-CR> <esc>
vnoremap <C-CR> <esc>
cnoremap <C-CR> <esc>
nnoremap <C-CR> <nop>

let &cpo=s:cpo_save
unlet s:cpo_save
