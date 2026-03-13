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
}
