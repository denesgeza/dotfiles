local options = {
  -- =============================================================================
  -- UI
  -- =============================================================================
  list = false,
  termguicolors = true, ---@type boolean -- Enables 24-bit RGB color in the TUI
  cmdheight = 2, ---@type 0 | 1 | 2
  listchars = { eol = "↲", tab = ">-", trail = "·" },
  showmode = false, ---@type boolean
  showcmd = true, ---@type boolean
  fillchars = {
    eob = " ",
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ", -- or "│" to use bar for show fold area
  },
  -- =============================================================================
  -- Indent, spacing
  -- =============================================================================
  autoindent = true,
  expandtab = true, ---@type boolean
  cindent = true, ---@type boolean
  smarttab = true, ---@type boolean
  -- =============================================================================
  -- Folding
  -- =============================================================================
  foldmethod = "expr", ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"
  foldlevel = 99, ---@type number
  foldlevelstart = 99, ---@type number
  foldenable = true, ---@type boolean
  -- foldtext = "v:lua.require'config.functions'.foldtext()", ---@type string
  -- =============================================================================
  -- Other
  -- =============================================================================
  splitright = true, ---@type boolean
  splitbelow = true, ---@type boolean
  mouse = "n", ---@type "n" | "v" | "i" | "c" | "h" | "a" | "r"
  swapfile = false, ---@type boolean
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
