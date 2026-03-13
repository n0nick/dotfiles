-- Plugin specifications for lazy.nvim

return {
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        on_highlights = function(hl, c)
          hl.NormalFloat = { bg = c.bg_dark }
          hl.FloatBorder = { fg = c.blue, bg = c.bg_dark }
        end,
      })
      vim.cmd.colorscheme('tokyonight-night')
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

