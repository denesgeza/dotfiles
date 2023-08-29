Is_Enabled = require("config.functions").is_enabled

local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  termguicolors = true,
  ---@type "auto" | "indent" | "expr" | "manual" | "marker" | "syntax""
  foldmethod = "marker",
  foldlevel = 10,
  -- foldlevelstart = 1,
  laststatus = 2,
  swapfile = false,
  showmode = false,
  cmdheight = 2,
  fillchars = [[eob: ,fold:•,foldopen:,foldsep: ,foldclose:]],
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
