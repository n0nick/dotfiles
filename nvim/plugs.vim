call plug#begin('~/.config/nvim/plugged')

" UI, Navigation
Plug 'kshenoy/vim-signature' " Toggle and display marks
Plug 'tpope/vim-unimpaired'  " Pairs of handy bracket mappings
Plug 'duff/vim-bufonly', { 'on': 'Bufonly' } " Keep only current buffer

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Colors
Plug 'chriskempson/vim-tomorrow-theme'

" Editing
Plug 'tpope/vim-repeat'          " Smarter repeats through '.'
Plug 'tpope/vim-surround'        " Quoting/parenthesizing made simple
Plug 'tpope/vim-abolish'         " Easy search, substitute, and abbreviate
Plug 'Raimondi/delimitMate'      " Insert mode auto-completion for delimiters
Plug 'tomtom/tcomment_vim'       " Commenting code lines
Plug 'benekastah/neomake'        " Asynchronous :make
Plug 'tommcdo/vim-lion'          " Simple alignment operator
Plug 'AndrewRadev/splitjoin.vim' " Transition between multiline and single lines

Plug 'tpope/vim-sleuth' " Automatically adjust shiftwidth, expandtab

" File formats
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'   }
Plug 'fatih/vim-go',             { 'for': 'go'       }
Plug 'digitaltoad/vim-jade',     { 'for': 'jade'     }
Plug 'tpope/vim-rails',          { 'for': 'ruby'     } " Rails-oriented editing
Plug 'tpope/vim-endwise',        { 'for': 'ruby'     } " Smart 'end' for Ruby
Plug 'shime/vim-livedown',       { 'for': 'markdown' } " Live Markdown preview

" Running tests
Plug 'janko-m/vim-test' " Run tests in current context
Plug 'kassio/neoterm'   " Re-usable terminal buffers

" Git, Github
Plug 'tpope/vim-fugitive'     " Git commands
Plug 'tpope/vim-git'          " Git syntax highlighting
Plug 'airblade/vim-gitgutter' " Git diff gutter
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', { 'on': 'Gist' } " Post to Gist

" Misc
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes', { 'on': 'Notes' }

call plug#end()
