if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set encoding=utf-8
set termencoding=utf-8

set viminfo='20,\"50
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set directory=~/tmp

set undofile
set undodir=$HOME/tmp/undo
set undolevels=1000
set undoreload=10000

set visualbell t_vb=
set belloff=cursor,esc

set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

set helplang=en
set history=500
set showcmd
set incsearch

set linebreak
set backspace=indent,eol,start

set printoptions=paper:letter
set ruler

set smartindent
set laststatus=2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set modeline
set wildmenu

set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:─,diff:─
set listchars=eol:↲,tab:⧐⧿,extends:▻,precedes:◅,nbsp:⎵
set list
set foldmethod=marker
set background=dark

set cursorline
set colorcolumn=81

filetype indent on
filetype plugin on
syntax on
