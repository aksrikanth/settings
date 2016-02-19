" Local configurations
let extfile = expand("~/settings/config_local/gvimrc")
if filereadable(extfile)
  execute "source ".fnameescape(extfile)
endif

" vim:filetype=vim
