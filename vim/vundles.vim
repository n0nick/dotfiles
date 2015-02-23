set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" UI, Navigation
Plugin 'airblade/vim-gitgutter'
Plugin 'duff/vim-bufonly'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/ShowMarks'
Plugin 'elentok/replace-all.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'danro/rename.vim'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/neomru.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/unite-outline'

" Color
Plugin 'chriskempson/vim-tomorrow-theme'

" Tmux integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'

" Editing
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache'
Plugin 'junegunn/vim-easy-align'
Plugin 'tmhedberg/matchit'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/PreserveNoEOL'

" File formats
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'uarun/vim-protobuf'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'ngmy/vim-rubocop'

" Git, Github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'

" Misc
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
