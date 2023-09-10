-- local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

-- LSP-ZERO {{{
-- lsp_zero.on_attach(function(client, bufnr)
--   lsp_zero.default_keymaps({ buffer = bufnr })
-- end)

-- Set signs
-- lsp_zero.set_sign_icons({
--   error = "E",
--   warn = "W",
--   hint = "H",
--   info = "I",
-- })
-- Format on save
-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ["lua_ls"] = { "lua" },
--     ["rust_analyzer"] = { "rust" },
--   },
-- })
-- }}}
-- SERVERS {{{
-- -- Emmet {{{
lspconfig.emmet_language_server.setup({
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = true,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})
-- }}}
-- Pyright {{{
-- }}}
-- }}}
