filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'vundlevim/vundle.vim'

" Vim behavior
Plugin 'aksrikanth/whitespace.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'jazzcore/ctrlp-cmatcher'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/zoomwin'

" Filetype specific
Plugin 'aksrikanth/conceal-cc.vim'
Plugin 'aksrikanth/conceal-java.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'shougo/vimproc'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'

" Colorschemes
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
