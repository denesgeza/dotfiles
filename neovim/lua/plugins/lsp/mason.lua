return {
    "williamboman/mason.nvim",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            opts = { automatic_installation = true },
        },
    },
    build = ":MasonUpdate",
    config = true,
    opts = {
        ui = {
            check_outdated_packages_on_open = true,
            border = "single",
            height = 0.8,
            width = 0.5,
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
            "stylua", -- lua formatter
            "isort", -- python formatter
            "black", -- python formatter
            "eslint_d",
        },
    },
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
}
