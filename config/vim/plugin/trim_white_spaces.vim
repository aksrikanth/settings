if exists("b:trim_white_spaces_loaded")
  finish
endif
let b:trim_white_spaces_loaded = 1

function! TrimWhiteSpace()
    let original_pos = getpos('.')
    let original = original_pos[1]
    silent! %s/\s*$//

    let lineno = nextnonblank(1)
    let last_lineno = lineno
    while lineno > 0
        if lineno - last_lineno > 1
            silent! execute string(last_lineno+1).','.string(lineno -1).'d'
            if last_lineno < original
                let original= max([last_lineno, original  - (lineno - last_lineno -1)])
            endif
        endif
        let last_lineno =  lineno + 1
        let lineno = nextnonblank(last_lineno)
        if lineno <= 0
            let last_lineno -= 1
            let lineno = line('$')
            if lineno - last_lineno > 0
                silent! execute string(last_lineno+1).','.string(lineno).'d'
                if last_lineno < original
                    let original= max([last_lineno, original - (lineno - last_lineno)])
                endif
            endif
            break
        endif
    endwhile
    let original_pos[1] = min([original, last_lineno])
    call setpos('.', original_pos)
endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
" autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()
