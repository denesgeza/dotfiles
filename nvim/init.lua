-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- PLUGIN CONFIGS
require("plugins.configs.ufo")
require("plugins.configs.lspconfig")

-- THEMES
-- Dark theme
-- vim.cmd([[colorscheme kanagawa-dragon]])
vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme tokyonight]])
-- Light theme
-- vim.cmd([[colorscheme github_light]])
-- vim.cmd([[colorscheme kanagawa-lotus]])
