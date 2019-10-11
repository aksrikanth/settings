if exists("g:did_ftplugin")
  finish
endif
let did_ftplugin = 1

setlocal textwidth&
setlocal nowrap
setlocal noautoindent

" Balancing my books.
" Cursor column for various account columns.
let numAccountColumns = 10
let accountColumn0 = 9
let accountColumn1 = 29
let accountColumn2 = 41
let accountColumn3 = 53
let accountColumn4 = 61
let accountColumn5 = 77
let accountColumn6 = 89
let accountColumn7 = 101
let accountColumn8 = 109
let accountColumn9 = 121
let accountColumn10 = 137
let accountTotalCol = accountColumn10

function! BalanceLine (param)
    let l:clip = @"
    " Determine target columns.
    exec "let l:currCol = g:accountColumn" . (a:param + 5)

    " Compute total.
    exec "normal " . g:accountColumn1 . "|"
    silent! normal v$y
    new
    normal p
    silent! %!total 2
    let l:sum = getline (".")
    quit!

    " Negate total.
    let l:sum = substitute (l:sum, "^", "-", "")
    let l:sum = substitute (l:sum, "^--", "", "")

    " Insert total in target columns.
    call AddSpaces (l:currCol)
    exec "normal a" . l:sum

    call AddSpaces (g:accountTotalCol)
    exec "normal a" . l:sum
    normal $
    let @" = l:clip
endfunction
map <buffer> <Leader>1 :call BalanceLine (1)<CR>
map <buffer> <Leader>2 :call BalanceLine (2)<CR>
map <buffer> <Leader>3 :call BalanceLine (3)<CR>
map <buffer> <Leader>4 :call BalanceLine (4)<CR>
imap <buffer> <Leader>1 <C-o>:call BalanceLine (1)<CR>
imap <buffer> <Leader>2 <C-o>:call BalanceLine (2)<CR>
imap <buffer> <Leader>3 <C-o>:call BalanceLine (3)<CR>
imap <buffer> <Leader>4 <C-o>:call BalanceLine (4)<CR>

function! SumColumns ()
    let l:i = 1
    while l:i <= g:numAccountColumns
        exec "let l:currOffset = g:accountOffset" . l:i
        call SumColumn (l:i, l:currOffset)
        let l:i = l:i + 1
    endwhile
endfunction

" This is how many rows above the current month we want to compute totals
" from for this month.
let accountOffset1 = 2
let accountOffset2 = 2
let accountOffset3 = 2
let accountOffset4 = 2
let accountOffset5 = 2
let accountOffset6 = 1
let accountOffset7 = 1
let accountOffset8 = 1
let accountOffset9 = 1
let accountOffset10 = 1

function! SumColumn (param, offset)
    let l:clip = @"
    let l:totalLine = line (".")

    exec "let l:currCol = g:accountColumn" . a:param
    call AddSpaces (l:currCol)

    exec "let l:currOffset = g:accountOffset" . a:param
    if a:param < g:numAccountColumns
        exec "let l:nextCol = g:accountColumn" . (a:param + 1)
        exec "normal {" . l:currOffset . "k" . (l:nextCol - 1) . "|y"
    else
        exec "normal {" . l:currOffset . "k$y"
    endif

    new
    normal p
    silent! %!total 2 2>/dev/null
    let l:sum = getline (".")
    quit!
    normal 
    exec "normal a" . l:sum
    let @" = l:clip
endfunction

function! AddSpaces (c)
    normal $
    if col (".") == 1
        exec "normal a "
    endif
    if a:c > col (".")
        let l:tmp = a:c - col (".") - 1
        if l:tmp > 0
            exec "normal " . l:tmp . "a "
        else
            normal a
        endif
    endif
endfunction

function! InsertToNextTab ()
    normal $
    if col (".") == 1
        exec "normal a "
    endif
    let l:i = 0
    while l:i <= g:numAccountColumns
        exec "let l:targetCol = g:accountColumn" . l:i
        if l:targetCol > col (".") + 1
            break
        endif
        let l:i = l:i + 1
    endwhile
    let l:tmp = l:targetCol - col (".") - 1
    exec "normal " . l:tmp . "a "
endfunction
imap <buffer> <Tab> <Esc>:call InsertToNextTab ()<CR>A

function! NextTab ()
    let l:i = 0
    while l:i <= g:numAccountColumns
        exec "let l:targetCol = g:accountColumn" . l:i
        if l:targetCol > col (".")
            break
        endif
        let l:i = l:i + 1
    endwhile
    exec "normal " . l:targetCol . "|"
endfunction
map <buffer> <Tab> :call NextTab ()<CR>

function! UpdateTotals ()
    let l:clip = @"
    let l:l = line('.')
    let l:c = col('.')
    exec "normal G?Total?e+1\<CR>D"
    call SumColumns()
    exec "normal ".l:l."gg"
    exec "normal ".l:c."|"
    let @" = l:clip
endfunction
autocmd BufWritePre */accounts/*accounts silent call UpdateTotals ()
