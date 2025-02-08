local icons = require("settings.icons").diagnostics

return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "icons", ---@type "icons" |""
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.error,
          [vim.diagnostic.severity.WARN] = icons.warn,
          [vim.diagnostic.severity.INFO] = icons.info,
          [vim.diagnostic.severity.HINT] = icons.hint,
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
      },
    },
    inlay_hints = { enabled = false },
    codelens = { enabled = false },
    -- servers = {
    --   sourcekit = {
    --     setup = {
    --       capabilities = {
    --         workspace = {
    --           didChangeWatchedFiles = { dynamicRegistration = true },
    --         },
    --       },
    --     },
    --   },
    --   basedpyright = {},
    -- },
  },
}
