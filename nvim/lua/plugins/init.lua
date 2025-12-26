-- Plugin specifications for lazy.nvim

return {
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

