-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- THEMES
-- Dark theme
-- vim.cmd([[colorscheme kanagawa-dragon]])
-- vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme tokyonight]])
-- Light theme
-- vim.cmd([[colorscheme github_light]])

-- PLUGIN CONFIGS
-- require("plugins.configs.ufo")
-- require("plugins.configs.ruff_lsp")
require("plugins.configs.pyright")
