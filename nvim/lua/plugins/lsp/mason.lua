return {
  "williamboman/mason.nvim",
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
      "emmet-language-server",
      "debugpy",
      "jq",
      "json-lsp",
      "lua-language-server",
      "basedpyright",
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
}
