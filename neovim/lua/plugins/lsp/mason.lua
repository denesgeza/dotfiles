return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    -- "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  build = ":MasonUpdate",
  config = true,
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    ensure_installed = {
      "cssls",
      "lua_ls",
      "lua-language-server",
      "emmet_language_server",
      "basedpyright",
      "ruff",
      "prettier", -- prettier formatter
      "stylua",   -- lua formatter
      "isort",    -- python formatter
      "black",    -- python formatter
      "eslint_d",
    },
  },
  -- config = function()
  --   -- import mason
  --   local mason = require("mason")
  --
  --   -- import mason-lspconfig
  --   local mason_lspconfig = require("mason-lspconfig")
  --
  --   local mason_tool_installer = require("mason-tool-installer")
  --
  --   mason_lspconfig.setup({
  --     -- list of servers for mason to install
  --     ensure_installed = {
  --       "html",
  --       "cssls",
  --       "lua_ls",
  --       "lua-language-server",
  --       "emmet_ls",
  --       "prismals",
  --       "basedpyright",
  --       "ruff",
  --     },
  --   })
  --
  --   mason_tool_installer.setup({
  --     ensure_installed = {
  --       "prettier", -- prettier formatter
  --       "stylua",   -- lua formatter
  --       "isort",    -- python formatter
  --       "black",    -- python formatter
  --       "eslint_d",
  --     },
  --   })
  -- end,
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
}
