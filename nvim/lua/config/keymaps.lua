-- Key mappings

-- Basic mappings
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Exit insert mode' })
vim.keymap.set('n', '<Leader>.', "'.", { desc = 'Jump to last edit position' })
vim.keymap.set('n', 'vv', '<C-w>v', { silent = true, desc = 'Split window vertically' })
vim.keymap.set('n', 'ss', '<C-w>s', { silent = true, desc = 'Split window horizontally' })
vim.keymap.set('', '<Leader>hl', ':nohl<CR>', { desc = 'Clear search highlighting' })

-- Terminal mappings
vim.keymap.set('t', '<Leader>e', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { desc = 'Window prefix in terminal' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Navigate to left window from terminal' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Navigate to bottom window from terminal' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Navigate to top window from terminal' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Navigate to right window from terminal' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true, desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true, desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true, desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true, desc = 'Move to right window' })

-- Buffer management
vim.keymap.set('n', '<C-w>b', ':Bufonly<CR>', { silent = true, desc = 'Close all buffers except current' })

-- System clipboard
vim.keymap.set('v', '<Leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('', '<Leader>p', '"+p', { desc = 'Paste from system clipboard after cursor' })
vim.keymap.set('', '<Leader>P', '"+P', { desc = 'Paste from system clipboard before cursor' })

-- File navigation mappings with directory expansion (prepopulate command line)
local function make_dir_cmd(prefix)
  return function()
    local dir = vim.fn.fnameescape(vim.fn.expand('%:h')) .. '/'
    vim.fn.feedkeys(':' .. prefix .. ' ' .. dir, 'n')
  end
end

vim.keymap.set('', '<leader>ew', make_dir_cmd('e'), { desc = 'Edit file in current directory' })
vim.keymap.set('', '<leader>es', make_dir_cmd('sp'), { desc = 'Split and edit file in current directory' })
vim.keymap.set('', '<leader>ev', make_dir_cmd('vsp'), { desc = 'Vertical split and edit file in current directory' })
vim.keymap.set('', '<leader>et', make_dir_cmd('tabe'), { desc = 'Edit file in current directory in new tab' })

-- LSP (via lspsaga)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', '<C-]>', '<cmd>Lspsaga goto_definition<CR>', opts)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>', opts)
    vim.keymap.set('n', '<Leader>rn', '<cmd>Lspsaga rename<CR>', opts)
    vim.keymap.set('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
    vim.keymap.set('n', '<Leader>pd', '<cmd>Lspsaga peek_definition<CR>', opts)
    vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.keymap.set('n', '<Leader>ol', '<cmd>Lspsaga outline<CR>', opts)
    vim.keymap.set('n', '<Leader>gi', '<cmd>Lspsaga implement<CR>', opts)
    vim.keymap.set('n', '<Leader>pt', '<cmd>Lspsaga peek_type_definition<CR>', opts)
    vim.keymap.set('n', '<Leader>gt', '<cmd>Lspsaga goto_type_definition<CR>', opts)
    vim.keymap.set('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>', opts)
    vim.keymap.set('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>', opts)
  end,
})

-- Sudo save
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

