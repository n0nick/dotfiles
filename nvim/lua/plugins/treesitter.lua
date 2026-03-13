return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- Auto-install parsers on FileType
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if not pcall(vim.treesitter.language.inspect, lang) then
          pcall(function()
            require('nvim-treesitter').install(lang, function()
              vim.schedule(function()
                pcall(vim.treesitter.start, args.buf)
              end)
            end)
          end)
        else
          pcall(vim.treesitter.start, args.buf)
        end
      end,
    })
  end
}
