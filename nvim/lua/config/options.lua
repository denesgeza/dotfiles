local options = {
  autoindent = true,
  list = false,
  listchars = { eol = "↲", tab = "▸ ", trail = "·" },
  termguicolors = true,
  foldmethod = "indent",
  -- foldlevel = 1,
  -- foldlevelstart = 1,
  swapfile = false,
  showmode = true,
  scrolloff = 8,
  sidescrolloff = 8,
  wrap = false,
  fillchars = [[eob: ,fold:•,foldopen:,foldsep: ,foldclose:]],
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
