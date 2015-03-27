call plug#begin('~/.vim/plugged')

" UI, Navigation
Plug 'airblade/vim-gitgutter'
Plug 'duff/vim-bufonly', { 'on': 'Bufonly' }
Plug 'bling/vim-airline'
Plug 'vim-scripts/ShowMarks'
Plug 'elentok/replace-all.vim', { 'on': 'FindAll' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'danro/rename.vim', { 'on': 'Rename' }
Plug 'nathanaelkane/vim-indent-guides'

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
Plug 'tpope/vim-rails',              { 'for': 'ruby'       }
Plug 'tpope/vim-haml',               { 'for': 'haml'       }
Plug 'kchmck/vim-coffee-script',     { 'for': 'coffee'     }
Plug 'fatih/vim-go',                 { 'for': 'go'         }
Plug 'uarun/vim-protobuf',           { 'for': 'proto'      }
Plug 'pangloss/vim-javascript',      { 'for': 'javascript' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python'     }
Plug 'digitaltoad/vim-jade',         { 'for': 'jade'       }
Plug 'ngmy/vim-rubocop',             { 'for': 'ruby'       }

" Git, Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Misc
Plug 'xolox/vim-misc',  { 'on': 'Notes' }
Plug 'xolox/vim-notes', { 'on': 'Notes' }

call plug#end()
