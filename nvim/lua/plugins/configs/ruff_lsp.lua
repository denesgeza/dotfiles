--      ruff lsp
require("lspconfig").ruff_lsp.setup({
  on_attach = function(client, _)
    -- Disable hover in favor of PyRight
    client.server_capabilities.hoverProvider = false
  end,
  init_options = {
    settings = {
      -- args for ruff
      args = { "--ignore", "E501" },
    },
  },
})
