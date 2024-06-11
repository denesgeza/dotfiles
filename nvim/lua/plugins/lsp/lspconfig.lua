local icons = require("settings.icons").diagnostics
return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "", ---@type "icons" |""
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.Error,
          [vim.diagnostic.severity.WARN] = icons.Warn,
          [vim.diagnostic.severity.HINT] = icons.Hint,
          [vim.diagnostic.severity.INFO] = icons.Info,
        },
      },
    },
    inlay_hints = { enabled = false },
    codelens = { enabled = false },
  },
}
