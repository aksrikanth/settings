" Local configurations
let extfile = expand("~") . "/.local_vimrc"
if filereadable(extfile)
  execute "source ".fnameescape(extfile)
endif
