if exists("b:did_ftplugin")
  finish
endif

let b:html_mode = 1

runtime ftplugin/xml.vim
