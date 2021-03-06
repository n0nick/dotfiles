call plug#begin('~/.config/nvim/plugged')

" UI, Navigation
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature' " Toggle and display marks
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'duff/vim-bufonly', { 'on': 'Bufonly' } " Keep only current buffer
Plug 'Shougo/echodoc.vim' " Function signatures in command line

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
Plug 'w0rp/ale'             " Asynchronous linting
Plug 'tommcdo/vim-lion'     " Simple alignment operator
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search
Plug 'majutsushi/tagbar'
Plug 'sbdchd/neoformat', { 'on': 'Neoformat'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File formats
Plug 'fatih/vim-go',               { 'for': 'go', 'do': 'GoUpdateBinaries' }
Plug 'zchee/deoplete-go',          { 'for': 'go', 'do': 'make'}
Plug 'jodosha/vim-godebug',        { 'for': 'go'       }
Plug 'digitaltoad/vim-jade',       { 'for': 'jade'     }
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-rails',            { 'for': 'ruby'     }
Plug 'tpope/vim-endwise',          { 'for': 'ruby'     } " Smart 'end' for Ruby
Plug 'kchmck/vim-coffee-script',   { 'for': 'coffee'   }
" JS syntax plugins via https://goo.gl/rG8gvZ
Plug 'pangloss/vim-javascript',  { 'for': 'javascript' }
Plug 'mxw/vim-jsx',              { 'for': 'javascript' }
Plug 'elzr/vim-json',            { 'for': 'json'       }
Plug 'Einenlum/yaml-revealer',   { 'for': 'yaml' }
" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" Running tests
Plug 'janko-m/vim-test' " Run tests in current context
Plug 'kassio/neoterm'   " Re-usable terminal buffers

" Git
Plug 'tpope/vim-fugitive'     " Git commands
Plug 'christoomey/vim-conflicted' " Git conflict resolution
Plug 'tpope/vim-git'          " Git syntax highlighting
Plug 'airblade/vim-gitgutter' " Git diff gutter

" Misc
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', { 'on': 'Gist' } " Post to Gist

call plug#end()
