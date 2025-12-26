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

-- Leader key
vim.g.mapleader = ','

-- Key mappings
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<Leader>.', "'.")
vim.keymap.set('n', 'vv', '<C-w>v', { silent = true })
vim.keymap.set('n', 'ss', '<C-w>s', { silent = true })
vim.keymap.set('', '<Leader>hl', ':nohl<CR>')

-- Terminal mappings
vim.keymap.set('t', '<Leader>e', '<C-\\><C-n>')
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- Buffer management
vim.keymap.set('n', '<C-w>b', ':Bufonly<CR>', { silent = true })

-- System clipboard
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('', '<Leader>p', '"+p')
vim.keymap.set('', '<Leader>P', '"+P')

-- File navigation mappings with directory expansion (prepopulate command line)
function make_dir_cmd(prefix)
  local dir = vim.fn.fnameescape(vim.fn.expand('%:h')) .. '/'
  return ':' .. prefix .. ' ' .. dir
end
vim.keymap.set('', '<leader>ew', make_dir_cmd('e'))
vim.keymap.set('', '<leader>es', make_dir_cmd('sp'))
vim.keymap.set('', '<leader>ev', make_dir_cmd('vsp'))
vim.keymap.set('', '<leader>et', make_dir_cmd('tabe'))

-- Sudo save
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

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

-- Command aliases (typo helpers)
local function create_alias(name, cmd, opts)
  opts = opts or {}
  local has_args = opts.args ~= false
  local complete = opts.complete
  
  vim.api.nvim_create_user_command(name, function(alias_opts)
    local bang = alias_opts.bang and '!' or ''
    local args = has_args and (' ' .. (alias_opts.args or '')) or ''
    vim.cmd(cmd .. bang .. args)
  end, {
    bang = true,
    nargs = has_args and '?' or 0,
    complete = complete,
  })
end

-- Commands with args
create_alias('E', 'e', { complete = 'file' })
create_alias('W', 'w', { complete = 'file' })
create_alias('Wq', 'wq', { complete = 'file' })
create_alias('WQ', 'wq', { complete = 'file' })
create_alias('Set', 'set', { complete = 'option' })

-- Commands without args
create_alias('Wa', 'wa', { args = false })
create_alias('WA', 'wa', { args = false })
create_alias('Q', 'q', { args = false })
create_alias('QA', 'qa', { args = false })
create_alias('Qa', 'qa', { args = false })
create_alias('Bd', 'bd', { args = false })


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

