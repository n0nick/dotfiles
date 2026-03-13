-- Plugin specifications for lazy.nvim

return {
  -- Colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },

  -- Editing
  { 'numToStr/Comment.nvim' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-abolish' },

  -- Git
  { 'lewis6991/gitsigns.nvim' },
  -- { 'tpope/vim-fugitive' },
  -- { 'tpope/vim-git' },
  -- { 'christoomey/vim-conflicted' },

  -- Languages
  {
    "mason-org/mason.nvim",
    opts = {}
  }
}

