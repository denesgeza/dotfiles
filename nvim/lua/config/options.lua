local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  -- standard
  foldmethod = "marker",
  foldlevel = 99,
  foldlevelstart = 99,
  -- ufo settings
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  -- foldcolumn = "1" -- '0' is not bad
  -- foldenable = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
