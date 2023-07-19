-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Global settings
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- PLUGIN CONFIGS
require("plugins.configs.ufo")
require("plugins.configs.lspconfig")
require("plugins.configs.cmp")

-- THEMES
-- Dark theme
-- vim.cmd([[colorscheme kanagawa]])
vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme tokyonight]])
-- Light theme
-- vim.cmd([[colorscheme github_light]])
-- vim.cmd([[colorscheme kanagawa-lotus]])
