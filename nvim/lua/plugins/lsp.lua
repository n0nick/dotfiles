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

      vim.lsp.config('buf_ls', {
        cmd = { 'buf', 'beta', 'lsp' },
        root_markers = { 'buf.yaml', 'buf.work.yaml', '.git' },
        filetypes = { 'proto' },
      })
      vim.lsp.enable('buf_ls')

      -- TypeScript/JavaScript. cmd, filetypes and root_markers come from
      -- nvim-lspconfig's shipped lsp/vtsls.lua; only settings are overridden.
      vim.lsp.config('vtsls', {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
          typescript = {
            preferences = { includePackageJsonAutoImports = 'auto' },
            inlayHints = {
              parameterNames = { enabled = 'literals' },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
            },
          },
        },
      })
      vim.lsp.enable('vtsls')

      -- Svelte. cmd, filetypes and root_dir come from lspconfig's shipped
      -- lsp/svelte.lua, whose root_dir prefers a lockfile over .git -- which
      -- is what makes a SvelteKit app nested inside a Go repo resolve to the
      -- pnpm workspace root rather than the repo root.
      vim.lsp.enable('svelte')
    end,
  },

  -- Installs the servers that aren't already on PATH.
  -- gopls and buf are managed outside mason, so they're not listed here.
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = { 'vtsls', 'svelte' },
      -- Servers are configured and enabled explicitly above.
      automatic_enable = false,
    },
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
