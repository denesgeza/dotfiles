Is_Enabled = require("config.functions").is_enabled

return {
  "LunarVim/bigfile.nvim",
  enabled = Is_Enabled("bigfile"),
  init = function()
    -- default config
    require("bigfile").setup({
      filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*" }, -- autocmd pattern
      features = { -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    })
  end,
}
