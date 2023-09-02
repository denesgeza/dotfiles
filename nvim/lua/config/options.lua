Is_Enabled = require("config.functions").is_enabled

local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  termguicolors = true,
  ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"
  foldmethod = "indent",
  foldlevel = 99,
  foldlevelstart = 99,
  laststatus = 2,
  swapfile = false,
  showmode = false,
  cmdheight = 2,
  fillchars = [[eob: ,fold:•,foldopen:,foldsep: ,foldclose:]],
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
