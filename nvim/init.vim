filetype plugin indent on

set number
set expandtab
set tabstop=2 shiftwidth=2 smarttab
set list
set listchars=tab:▸\ ,trail:·
set wildmode=list:longest

let g:mapleader=","
inoremap jk <esc>
nnoremap <Leader>. '.
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
map <Leader>hl :nohl<CR>

if has('nvim')
  " exit terminal mode
  tnoremap <Leader>e <C-\><C-n>

  " navigate outside of terminal
  tnoremap <C-w> <C-\><C-n><C-w>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
end

" easy window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" leave current buffer only
nnoremap <silent> <C-w>b :Bufonly<CR>

" system clipboard
vmap <Leader>y "+y
map <Leader>p "+p<CR>
map <Leader>P "+P<CR>

" easy file navigation http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Sudo save http://stackoverflow.com/a/7078429/107085
cmap w!! w !sudo tee > /dev/null %

" define a group `vimrc` and initialize.
augroup vimrc
  autocmd!
augroup END

" turn on spellchecker in Git commit messages
autocmd vimrc FileType gitcommit setlocal spell

" automatically open quickfix window for grep results
autocmd vimrc QuickFixCmdPost *grep* cwindow

" load installed plugs
source ~/.config/nvim/plugs.vim

colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" http://blog.sanctum.geek.nz/vim-command-typos/
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>

  command! -bang Bd bd<bang>
  command! -bang -nargs=? -complete=option Set set<bang> <args>
endif

lua << EOF
local cmp = require "cmp"
local cmp_types = require"cmp.types.cmp"

cmp.setup {
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp_types.SelectBehavior.Insert }), 
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp_types.SelectBehavior.Insert }),
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
  }),
}
EOF

lua << EOF
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
EOF

lua <<EOF
require 'go'.setup({
  goimports = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
  lsp_cfg = {
    capabilities = capabilities,
    }, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  dap_debug = true,
})

require'vim.lsp.protocol'
require'lsp_signature'.setup()
EOF

" python virtual environment for Neovim https://neovim.io/doc/user/provider.html#python-virtualenv
if filereadable(expand("~/.config/nvim/py3nvim/bin/python"))
  let g:python3_host_prog = expand("~/.config/nvim/py3nvim/bin/python")
endif

if filereadable(expand("~/.config/nvim/local.vim"))
  source ~/.config/nvim/local.vim
endif
