return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require('nvim-treesitter')
    ts.setup({})

    -- Cache the installed set; get_installed() scans the parser dir.
    local installed = {}
    for _, lang in ipairs(ts.get_installed()) do
      installed[lang] = true
    end

    local available = {}
    for _, lang in ipairs(ts.get_available()) do
      available[lang] = true
    end

    -- Guards against re-triggering a download for a language whose install
    -- is already in flight. Without this, every FileType event kicks off a
    -- fresh clone.
    local pending = {}

    local function start(buf)
      if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.treesitter.start, buf)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == '' then
          return
        end

        local lang = vim.treesitter.language.get_lang(ft) or ft

        if installed[lang] then
          start(args.buf)
          return
        end

        if pending[lang] or not available[lang] then
          return
        end
        pending[lang] = true

        -- install() returns an async handle; the completion callback has to be
        -- passed to :await(). Passing it as install()'s second argument means
        -- it never runs and the parser is never started.
        ts.install(lang):await(function(err)
          pending[lang] = nil
          if err then
            return
          end
          installed[lang] = true
          vim.schedule(function()
            start(args.buf)
          end)
        end)
      end,
    })
  end
}
