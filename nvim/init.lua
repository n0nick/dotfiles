-- Display
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.wildmode = 'list:longest'

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- Leader key (must be set before keymaps)
vim.g.mapleader = ','

-- Key mappings
require('config.keymaps')

-- Command aliases (typo helpers)
require('config.typos')

-- Autocommands
local vimrc_group = vim.api.nvim_create_augroup('vimrc', { clear = true })

-- Spellcheck in Git commit messages
vim.api.nvim_create_autocmd('FileType', {
  group = vimrc_group,
  pattern = 'gitcommit',
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Open quickfix window for grep results
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = vimrc_group,
  pattern = '*grep*',
  callback = function()
    vim.cmd('cwindow')
  end,
})

-- Python virtual environment for Neovim
local python3_host_prog = vim.fn.expand('~/.config/nvim/py3nvim/bin/python')
if vim.fn.filereadable(python3_host_prog) == 1 then
  vim.g.python3_host_prog = python3_host_prog
end

-- Local config
local local_config = vim.fn.expand('~/.config/nvim/local.vim')
if vim.fn.filereadable(local_config) == 1 then
  vim.cmd('source ' .. local_config)
end

