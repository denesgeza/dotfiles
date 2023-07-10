local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  -- NOTE: Testing
  root_dir = function(fname)
    return lspconfig.util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git")(fname)
      or lspconfig.util.path.dirname(fname)
  end,
  -- NOTE: End
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  },
  single_file_support = true,
})

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
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
})

-- lspconfig.ruff_lsp.setup({
--   on_attach = function(client, _)
--     -- Disable hover in favor of PyRight
--     client.server_capabilities.hoverProvider = false
--   end,
--   init_options = {
--     settings = {
--       -- args for ruff
--       args = { "--ignore", "E501" },
--     },
--   },
-- })
