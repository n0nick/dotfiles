call plug#begin('~/.vim/plugged')

" UI, Navigation
Plug 'bling/vim-airline'
Plug 'duff/vim-bufonly',        { 'on': 'Bufonly' } " Keep only current buffer
Plug 'elentok/replace-all.vim', { 'on': 'FindAll' } " Project find and replace
Plug 'nathanaelkane/vim-indent-guides' " Visualize indent blocks
Plug 'tpope/vim-unimpaired'            " Pairs of handy bracket mappings
Plug 'tpope/vim-projectionist'         " Project configuration
Plug 'vim-scripts/ShowMarks'           " Show marks in gutter

" Color
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }

" Tmux integration
Plug 'benmills/vimux'                 " Tmux interaction
Plug 'jgdavey/vim-turbux'             " Turbo Ruby testing with Tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between Tmux and Vim

" Editing
Plug 'tpope/vim-sensible'   " Sensible defaults
Plug 'tpope/vim-repeat'     " Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-surround'   " Quoting/parenthesizing made simple
Plug 'tpope/vim-abolish'    " Easy search, substitute, and abbreviate
Plug 'Raimondi/delimitMate' " Insert mode auto-completion for delimiters
Plug 'tomtom/tcomment_vim'  " Commenting code lines
Plug 'scrooloose/syntastic' " Syntax checking hacks
Plug 'Shougo/neocomplcache' " Ultimate auto-completion system
Plug 'tmhedberg/matchit'    " Extended % matching for HTML, LaTeX etc.
Plug 'junegunn/vim-easy-align'       " Text column alignment
Plug 'vim-scripts/PreserveNoEOL'     " Preserve missing EOL at end of files
Plug 'editorconfig/editorconfig-vim' " Code style conventions

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
Plug 'airblade/vim-gitgutter'                   " Git diff gutter
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tpope/vim-git'                            " Git syntax highlighting
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim' " Post to Gist

" Notes
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes', { 'on': 'Notes' }

call plug#end()
