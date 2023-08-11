-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Global settings {{{
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- }}}
-- Plugin configs {{{
require("plugins.configs.lspconfig")
-- require("plugins.configs.miniclue")
-- require("plugins.configs.latex")
-- }}}
-- LSP Settings {{{
-- for lsp_lines
vim.diagnostic.config({ virtual_text = false })
--}}}
-- NeoVide settings {{{
if vim.g.neovide then
  require("plugins.configs.neovide")
end
-- }}}
-- Highlight Groups {{{
-- for nvim-cmp highlight check https://www.youtube.com/watch?v=rRApFii8MKA
-- https://www.youtube.com/playlist?list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN
vim.api.nvim_set_hl(0, "MyPMenuSel", { bg = "#aaafff", fg = "#000000", bold = true, italic = true })
vim.api.nvim_set_hl(0, "MyPMenu", { bg = "none", blend = 0 })
--}}}
