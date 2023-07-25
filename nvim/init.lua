-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Global settings
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- PLUGIN CONFIGS
require("plugins.configs.ufo")
require("plugins.configs.lspconfig")

-- THEMES
-- vim.cmd([[colorscheme kanagawa]])
vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme github_light]])
-- vim.cmd([[colorscheme kanagawa-lotus]])

-- HIGHLIGHT GROUPS
-- for nvim-cmp highlight check https://www.youtube.com/watch?v=rRApFii8MKA
-- https://www.youtube.com/playlist?list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN
vim.api.nvim_set_hl(0, "MyPMenuSel", { bg = "#aaafff", fg = "#000000", bold = true, italic = true })
vim.api.nvim_set_hl(0, "MyPMenu", { bg = "none", fg = "none", ctermbg = "none", blend = 0 })

-- CUSTOM SETTINGS
vim.diagnostic.config({ virtual_text = false })
