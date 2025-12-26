-- Key mappings

-- Basic mappings
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
local function make_dir_cmd(prefix)
  return function()
    local dir = vim.fn.fnameescape(vim.fn.expand('%:h')) .. '/'
    vim.fn.feedkeys(':' .. prefix .. ' ' .. dir, 'n')
  end
end

vim.keymap.set('', '<leader>ew', make_dir_cmd('e'))
vim.keymap.set('', '<leader>es', make_dir_cmd('sp'))
vim.keymap.set('', '<leader>ev', make_dir_cmd('vsp'))
vim.keymap.set('', '<leader>et', make_dir_cmd('tabe'))

-- Sudo save
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

