local lspconfig = require("lspconfig")
local lsp = require("lsp-zero").preset({})

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

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ bufnr = bufnr })
end)

-- Set signs
lsp.set_sign_icons({
  error = "E",
  warn = "W",
  hint = "H",
  info = "I",
})
-- Format on save
lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["lua_ls"] = { "lua" },
    ["rust_analyzer"] = { "rust" },
  },
})

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
