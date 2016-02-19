" Local configurations
let extfile = expand("~/settings/config_local/vimrc")
if filereadable(extfile)
  execute "source ".fnameescape(extfile)
endif
