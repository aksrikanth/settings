" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ctrlp
let g:ctrlp_follow_symlinks   = 0
let g:ctrlp_match_func        = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_depth         = 100
let g:ctrlp_max_files         = 0
let g:ctrlp_user_command      = ['.git', 'cd %s && git ls-files', 'find %s -type f']
let g:ctrlp_working_path_mode = 'ra'

" haskell
let hs_highlight_boolean    = 1
let hs_highlight_types      = 1
let hs_highlight_more_types = 1
let hs_highlight_debug      = 1
let hs_highlight_delimiters = 1

" mustache
let g:mustache_abbreviations = 1
