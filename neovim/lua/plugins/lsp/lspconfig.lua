return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            -- import lspconfig plugin
            local lspconfig = require("lspconfig")

            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()

            mason_lspconfig.setup_handlers({
                -- default handler for installed servers
                function(server_name, bufnr)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["svelte"] = function()
                    -- configure svelte server
                    lspconfig["svelte"].setup({
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            if client.resolved_capabilities.document_highlight then
                                vim.api.nvim_create_autocmd("BufWritePost", {
                                    pattern = { "*.js", "*.ts" },
                                    callback = function(ctx)
                                        -- Here use ctx.match instead of ctx.file
                                        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                                    end,
                                })
                            end
                        end,
                    })
                end,
                ["ruff"] = function()
                    lspconfig["ruff"].setup({
                        capabilities = capabilities,
                        on_attach = function(client, _)
                            if client.name == "ruff" then
                                client.server_capabilities.hoverProvider = false
                            end
                        end,
                    })
                end,
                ["basedpyright"] = function()
                    lspconfig["basedpyright"].setup({
                        settings = {
                            basedpyright = {
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    ignore = { "*" },
                                },
                            },
                        },
                    })
                end,
                ["graphql"] = function()
                    -- configure graphql language server
                    lspconfig["graphql"].setup({
                        capabilities = capabilities,
                        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
                    })
                end,
                ["emmet_ls"] = function()
                    -- configure emmet language server
                    lspconfig["emmet_ls"].setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html",
                            "typescriptreact",
                            "javascriptreact",
                            "css",
                            "sass",
                            "scss",
                            "less",
                            "svelte",
                        },
                    })
                end,
                ["lua_ls"] = function()
                    -- configure lua server (with special settings)
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                -- make the language server recognize "vim" global
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                                workspace = {
                                    checkThirdParty = false,
                                },
                                codeLens = {
                                    enable = true,
                                },
                                doc = { privateName = { "^_" } },
                                hint = {
                                    enable = true,
                                    setType = false,
                                    paramType = true,
                                    paramName = "Disable",
                                    semicolon = "Disable",
                                    arrayIndex = "Disable",
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = {
                enabled = true,
            },
            -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the code lenses.
            codelens = {
                enabled = false,
            },
            -- Enable lsp cursor word highlighting
            document_highlight = {
                enabled = true,
            },
        },
    },
}
