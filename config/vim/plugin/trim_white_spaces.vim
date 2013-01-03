if exists("b:trim_white_spaces_loaded")
  finish
endif
let b:trim_white_spaces_loaded = 1

function! <SID>TrimWhiteSpace()
    let row = line('.')
    let col = col('.')
    silent! %s/\s*$//  " remove trailing whitespace
    silent! %s/\n\{3,}/\r\r/e  " condense consecutive blank lines
    call cursor(row, col)
endfunction

autocmd BufWritePre <buffer> :call <SID>TrimWhiteSpace()
