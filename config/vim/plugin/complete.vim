" Insert-mode
imap <Tab> <C-R>=TabComplete(0)<CR>
imap <S-Tab> <C-R>=TabComplete(1)<CR>

let g:lastComplete = ""
function! TabComplete (arg)
    let l:line = getline ('.')
    let l:lineHead = strpart (l:line, 0, col ('.') - 1)

    if (l:lineHead =~ '\s\+$'
            \|| (l:lineHead =~ '^\s*$')
            \|| ((g:lastComplete != '') && (l:line == g:lastComplete)))
        let l:ans = "\<Tab>"
    else
        let g:lastComplete = l:line
        if a:arg == 0
            let l:ans = "\<C-n>"
        else
            let l:ans = "\<C-p>"
        endif
    endif

    return l:ans
endfunction

" Using */# to search for visually selected text.
vmap <silent> * :<C-U>let old_reg=@"<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '\\/.*$^~[]'), "[ \t\n]\\+", '\\_s\\+', 'g')<CR><CR>
      \:let @"=old_reg<CR>
vmap <silent> # :<C-U>let old_reg=@"<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '\\?.*$^~[]'), "[ \t\n]\\+", '\\_s\\+', 'g')<CR><CR>
      \:let @"=old_reg<CR>
