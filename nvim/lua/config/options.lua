local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  -- termguicolors = true,
  foldmethod = "marker",
  -- foldlevel = 1,
  -- foldlevelstart = 1,
  swapfile = false,
  -- ufo settings
  -- fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  -- foldcolumn = "1" -- '0' is not bad
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
