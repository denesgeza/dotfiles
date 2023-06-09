local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  termguicolors = true,
  -- standard
  foldmethod = "marker",
  -- foldcolumn = 1,
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  swapfile = false,
  -- ufo settings
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  -- foldcolumn = "1" -- '0' is not bad
  -- foldenable = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
