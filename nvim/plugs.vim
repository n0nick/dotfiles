call plug#begin('~/.config/nvim/plugged')

" UI, Navigation
Plug 'vim-airline/vim-airline' " Footer UI
Plug 'vim-airline/vim-airline-themes' " Footer UI
Plug 'kshenoy/vim-signature' " Toggle and display marks
Plug 'tpope/vim-unimpaired'  " Pairs of handy bracket mappings
Plug 'duff/vim-bufonly', { 'on': 'Bufonly' } " Keep only current buffer

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Colors
if has('mac')
  Plug 'chriskempson/vim-tomorrow-theme'
else
  Plug 'chriskempson/base16-vim'
endif

" Editing
Plug 'tpope/vim-repeat'     " Smarter repeats through '.'
Plug 'tpope/vim-surround'   " Quoting/parenthesizing made simple
Plug 'tpope/vim-abolish'    " Easy search, substitute, and abbreviate
Plug 'Raimondi/delimitMate' " Insert mode auto-completion for delimiters
Plug 'tomtom/tcomment_vim'  " Commenting code lines
Plug 'benekastah/neomake'   " Asynchronous :make
Plug 'tommcdo/vim-lion'     " Simple alignment operator
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search
Plug 'majutsushi/tagbar'

" File formats
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee'   }
Plug 'fatih/vim-go',             { 'for': 'go'       }
Plug 'digitaltoad/vim-jade',     { 'for': 'jade'     }
Plug 'shime/vim-livedown',       { 'for': 'markdown' } " Live Markdown preview
Plug 'tpope/vim-rails',          { 'for': 'ruby'     } " Rails-oriented editing
Plug 'tpope/vim-endwise',        { 'for': 'ruby'     } " Smart 'end' for Ruby
" JS syntax plugins via https://goo.gl/rG8gvZ
Plug 'pangloss/vim-javascript',  { 'for': 'javascript' }
Plug 'mxw/vim-jsx',              { 'for': 'javascript' }
Plug 'elzr/vim-json',            { 'for': 'json'       }
Plug 'jaawerth/nrun.vim'

Plug 'terryma/vim-expand-region'

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
