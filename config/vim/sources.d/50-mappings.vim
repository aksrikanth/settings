let mapleader = ','

" Tab navigation
map <S-Left> gT
map <S-Right> gt
imap <S-Left> <Esc>gT
imap <S-Right> <Esc>gt

" Action mappings
nmap <leader>c <plug>CommentaryLine
vmap <leader>c <plug>Commentary
nmap <leader>t :TagbarToggle<CR>
nmap <leader>x :call Clear()<CR>
nmap <leader>s :SemanticHighlightToggle<CR>
