-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- THEMES
-- Dark theme
-- vim.cmd([[colorscheme kanagawa-dragon]])
-- vim.cmd([[colorscheme github_dark_colorblind]])
-- Light theme
-- vim.cmd([[colorscheme kanagawa-lotus]])
vim.cmd([[colorscheme github_light]])

Is_Enabled = require("config.functions").is_enabled

-- PLUGIN CONFIGS
if Is_Enabled("ufo") then
  require("plugins.configs.ufo")
end

require("plugins.configs.ruff_lsp")
