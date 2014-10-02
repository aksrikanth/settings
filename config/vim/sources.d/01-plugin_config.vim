let g:ctrlp_follow_symlinks=0
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_depth=100
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files', 'find %s -type f']
let g:ctrlp_working_path_mode = 'ra'
let g:mustache_abbreviations = 1
