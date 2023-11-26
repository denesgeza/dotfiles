local functions = require("config.functions")
Is_Enabled = functions.is_enabled

local options = {
  -- =============================================================================
  -- UI
  -- =============================================================================
  list = false,
  termguicolors = true, ---@type boolean -- Enables 24-bit RGB color in the TUI
  listchars = { eol = "↲", tab = ">-", trail = "·" },
  cmdheight = 0, ---@type 0 | 1 | 2
  showmode = false, ---@type boolean
  showcmd = false, ---@type boolean
  -- statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T",
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
  foldlevel = 0, ---@type number
  foldlevelstart = 1, ---@type number
  foldenable = true, ---@type boolean
  fillchars = {
    fold = " ",
    foldopen = "",
    foldclose = "",
  },
  -- =============================================================================
  -- Other
  -- =============================================================================
  splitright = true, ---@type boolean
  splitbelow = true, ---@type boolean
  mouse = "n", ---@type "n" | "v" | "i" | "c" | "h" | "a" | "r"
  swapfile = false, ---@type boolean
  wildignore = {
    "*.o",
    "*.obj,*~",
    "*.git*",
    "*.meteor*",
    "*vim/backups*",
    "*sass-cache*",
    "*mypy_cache*",
    "*__pycache__*",
    "*cache*",
    "*logs*",
    "*node_modules*",
    "**/node_modules/**",
    "*DS_Store*",
    "*.gem",
    "log/**",
    "tmp/**",
    "*package-lock.json*",
    "**/dist/**",
    "**/.next/**",
    "**/.nx/**",
  },
}
-- =============================================================================
-- Globals
-- =============================================================================

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

for k, v in pairs(options) do
  vim.opt[k] = v
end
