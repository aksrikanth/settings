setlocal foldmethod=expr
setlocal foldexpr=HamlFoldExpr(v:lnum)
setlocal foldtext=HamlFoldText()

"-----------------------------------------------------------------------------
function! s:GetFoldLevel(lnum,min_indent)
    let result = 0

    let lindent = indent(a:lnum)
    if lindent==0
        " let's make it short if we reached the root of a fold
        return 0
    endif

    let cnum = prevnonblank(a:lnum-1)
    while cnum > 0
        let cindent = indent(cnum)
        if cindent >= lindent
            " Skip a line that has a greater indentation than the consiedered
            " indentation.
            let cnum = prevnonblank(cnum-1)
            continue
        endif

        let lindent = cindent

        let line = getline(cnum)
        if line =~ '^\s*/'
            " Found the marker of a new fold
            if cindent >= a:min_indent
                " This fold is an ancestor
                let result += 1
            endif
        endif

        if cindent == 0
            " Reached the root of a fold: the scan is complete
            break
        endif

        let cnum = prevnonblank(cnum-1)
    endwhile

    return result
endfunction

"-----------------------------------------------------------------------------
function! HamlFoldExpr(lnum)
    let line = getline(a:lnum)

    if strlen(line) == 0 || line =~ '^\s*$'
        " Ignore blank lines
        return "="
    endif

    if line =~ '^\s*/'
        " Found a marker: figure out what level it is at and return an
        " incremented value
        return '>'.string(1+s:GetFoldLevel(a:lnum,0))
    endif

    let indent = indent(a:lnum)
    if indent == 0
        return '0'
    endif

    " If the next line is a de-indent that is greater than the current fold ->
    " close the fold
    let nnum = nextnonblank(a:lnum+1)
    if nnum < 0
        " End of file
        return '='
    endif

    let nindent = indent(nnum)
    if nindent >= indent
        " Indentation of the next line is bigger than this one
        return '='
    endif

    " At this point we know that there is a de-indentation.
    " If this is a continuation, then we should ignore the de-indentation
    if line[-1:] == '|' && line !~ 'do\s+|.*|$'
        let nline = getline(nnum)
        if nline[-1:] == '|' && nline !~ 'do\s+|.*|$'
            return '='
        endif
    endif

    " We need to search the file backwards to find the previous known folding
    " ancestor that has an identation level at least as small as the next line.
    let deindent = s:GetFoldLevel(a:lnum,nindent)
    if deindent > 0
        return 's'.string(deindent)
    endif

    return '='

endfunction

"-----------------------------------------------------------------------------
function! HamlFoldText()
    let line_count = 1+v:foldend-v:foldstart
    let text = substitute(getline(v:foldstart), '^.*/\s\+\(.*\)$', '\1', '')
    return ' ** '.text.' - '.string(line_count).' lines '
endfunction

