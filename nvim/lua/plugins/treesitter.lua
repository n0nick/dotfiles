return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      -- Directory to install parsers and queries to
      install_dir = vim.fn.stdpath('data') .. '/site',
    })

    -- Install parsers
    require("nvim-treesitter").install({
      "csv", "dockerfile", "gitignore", "go", "gomod", "gosum",
      "gowork", "javascript", "json", "lua", "markdown", "proto",
      "python", "rego", "sql", "yaml"
    })
  end
}

