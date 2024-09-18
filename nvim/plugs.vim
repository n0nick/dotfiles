call plug#begin('~/.config/nvim/plugged')

Plug 'duff/vim-bufonly', { 'on': 'Bufonly' } " Keep only current buffer
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'folke/tokyonight.nvim'
Plug 'tpope/vim-repeat'     " Smarter repeats through '.'
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'tpope/vim-surround'   " Quoting/parenthesizing made simple

" Go
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSInstall vim vimdoc go' }
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim', { 'for': 'go' }
Plug 'ray-x/guihua.lua' " recommended if need floating window support
Plug 'ray-x/lsp_signature.nvim', { 'for': 'go' }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'


"" UI, Navigation
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'kshenoy/vim-signature' " Toggle and display marks
"Plug 'Shougo/echodoc.vim' " Function signatures in command line

"" Tmux integration
"Plug 'christoomey/vim-tmux-navigator'

"" Editing
"Plug 'tomtom/tcomment_vim'  " Commenting code lines
"Plug 'w0rp/ale'             " Asynchronous linting
"Plug 'tommcdo/vim-lion'     " Simple alignment operator
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search
"Plug 'majutsushi/tagbar'
"Plug 'sbdchd/neoformat', { 'on': 'Neoformat'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Async completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" File formats
"Plug 'fatih/vim-go',               { 'for': 'go', 'do': 'GoUpdateBinaries' }
"Plug 'zchee/deoplete-go',          { 'for': 'go', 'do': 'make'}
"Plug 'jodosha/vim-godebug',        { 'for': 'go'       }
"Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & yarn install'  }
"Plug 'elzr/vim-json',            { 'for': 'json'       }
"Plug 'Einenlum/yaml-revealer',   { 'for': 'yaml' }

"" Git
Plug 'tpope/vim-fugitive'     " Git commands
Plug 'tpope/vim-git'          " Git syntax highlighting
Plug 'christoomey/vim-conflicted' " Git conflict resolution
Plug 'airblade/vim-gitgutter' " Git diff gutter

"" Misc
"Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', { 'on': 'Gist' } " Post to Gist

call plug#end()
