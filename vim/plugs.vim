call plug#begin('~/.vim/plugged')

" UI, Navigation
Plug 'airblade/vim-gitgutter'
Plug 'duff/vim-bufonly'
Plug 'bling/vim-airline'
Plug 'vim-scripts/ShowMarks'
Plug 'elentok/replace-all.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'danro/rename.vim'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/neomru.vim'
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/unite-outline'

" Color
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'

" Editing
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplcache'
Plug 'junegunn/vim-easy-align'
Plug 'tmhedberg/matchit'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/PreserveNoEOL'

" File formats
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'uarun/vim-protobuf'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'vim-scripts/indentpython.vim'
Plug 'digitaltoad/vim-jade'
Plug 'ngmy/vim-rubocop'

" Git, Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Misc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

call plug#end()
