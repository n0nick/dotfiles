return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config('gopls', {
        cmd = { 'gopls' },
        root_markers = { 'go.mod', 'go.work', '.git' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      })
      vim.lsp.enable('gopls')
    end,
  },

  -- LSP UI enhancements
  {
    'nvimdev/lspsaga.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('lspsaga').setup({
        lightbulb = { enable = false },
        finder = {
          keys = {
            toggle_or_open = '<CR>',
          },
        },
        definition = {
          keys = {
            edit = '<CR>',
          },
        },
        outline = {
          keys = {
            toggle_or_jump = '<CR>',
          },
        },
        callhierarchy = {
          keys = {
            edit = '<CR>',
          },
        },
        typehierarchy = {
          keys = {
            edit = '<CR>',
          },
        },
      })
    end,
  },

  -- Autocompletion
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },
      signature = {
        enabled = true,
        window = { border = 'rounded' },
      },
      completion = {
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
    },
  },

  -- Keymap discovery
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },
}
