return {
  {
    "mason-org/mason.nvim",
    -- version = "1.11.0", -- NOTE: Until Lazyvim is updated
    opts = {
      ui = {
        width = 120,
        height = 40,
        border = "single", ---@type "rounded" | "single" | "double" | "shadow" | "none"
        position = "top", ---@type "center" | "top" | "bottom"
        winblend = 90,
        icons = {
          package_installed = "",
          package_uninstalled = "",
          package_pending = "➜",
        },
      },
      ensure_installed = {
        "basedpyright",
        "css-lsp",
        "debugpy",
        "emmet-language-server",
        "htmx-lsp",
        "jq",
        "lua-language-server",
        "prettier",
        "prettierd",
        "rust-analyzer",
        "ruff",
        "stylua",
        "shfmt",
        "taplo",
        "yamlfmt",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    -- version = "1.32.0", -- NOTE: Until Lazyvim is updated
  },
}
