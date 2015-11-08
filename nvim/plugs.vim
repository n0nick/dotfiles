call plug#begin('~/.config/nvim/plugged')

" UI, Navigation
Plug 'airblade/vim-gitgutter'
Plug 'duff/vim-bufonly', { 'on': 'Bufonly' }
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-unimpaired'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Colors
Plug 'chriskempson/vim-tomorrow-theme'

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'benekastah/neomake'
Plug 'tommcdo/vim-lion'
Plug 'AndrewRadev/splitjoin.vim'

" File formats
Plug 'tpope/vim-rails',          { 'for': 'ruby'     }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'   }
Plug 'fatih/vim-go',             { 'for': 'go'       }
Plug 'digitaltoad/vim-jade',     { 'for': 'jade'     }
Plug 'shime/vim-livedown',       { 'for': 'markdown' }

" Running tests
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'

" Git, Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', { 'on': 'Gist' } 

" Misc
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes', { 'on': 'Notes' }

call plug#end()
