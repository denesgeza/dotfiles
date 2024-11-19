local icons = require("settings.icons").diagnostics

return {
  {
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
            [vim.diagnostic.severity.ERROR] = icons.Error,
            [vim.diagnostic.severity.WARN] = icons.Warn,
            [vim.diagnostic.severity.HINT] = icons.Hint,
            [vim.diagnostic.severity.INFO] = icons.Info,
          },
        },
      },
      inlay_hints = { enabled = false },
      codelens = { enabled = false },
      servers = {
        sourcekit = {
          setup = {
            capabilities = {
              workspace = {
                didChangeWatchedFiles = { dynamicRegistration = true },
              },
            },
          },
        },
        basedpyright = {},
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function(_, opts)
  --     local lspconfig = require("lspconfig")
  --     local has_blink, blink = pcall(require, "blink.cmp")
  --
  --     for server, server_opts in pairs(opts.servers or {}) do
  --       if server_opts then
  --         local capabilities = vim.tbl_deep_extend(
  --           "force",
  --           {},
  --           vim.lsp.protocol.make_client_capabilities(),
  --           has_blink and blink.get_lsp_capabilities(server_opts.capabilities) or {},
  --           opts.capabilities or {}
  --         )
  --         -- server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
  --         server_opts.capabilities = capabilities
  --
  --         local s_opts = vim.tbl_deep_extend("force", { capabilities = vim.deepcopy(server_opts) }, server or {})
  --         lspconfig[server].setup(s_opts)
  --       end
  --     end
  --   end,
  -- },
}
