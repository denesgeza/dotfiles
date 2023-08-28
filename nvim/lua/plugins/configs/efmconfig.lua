-- EFM Config setup
-- Register linters and formatters per language
-- local eslint = require("efmls-configs.linters.eslint")
local prettier = require("efmls-configs.formatters.prettier_d")
local stylua = require("efmls-configs.formatters.stylua")
local black = require("efmls-configs.formatters.black")
-- local isort = require("efmls-configs.formatters.isort")
local rustfmt = require("efmls-configs.formatters.rustfmt")

local languages = {
  typescript = { prettier },
  -- typescript = { eslint, prettier },
  javascript = { prettier },
  lua = { stylua },
  -- python = { isort, black },
  python = { black },
  html = { prettier },
  rust = { rustfmt },
}

-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
-- local languages = require('efmls-configs.defaults').languages()

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { ".git/" },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))
-- require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
-- Pass your custom lsp config below like on_attach and capabilities
--
-- on_attach = on_attach,
-- capabilities = capabilities,
-- }))
