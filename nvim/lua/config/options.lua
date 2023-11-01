local functions = require("config.functions")
Is_Enabled = functions.is_enabled

local options = {
  -- =============================================================================
  -- UI
  -- =============================================================================
  list = false,
  termguicolors = true, ---@type boolean -- Enables 24-bit RGB color in the TUI
  cmdheight = 0, ---@type 0 | 1 | 2
  listchars = { eol = "↲", tab = ">-", trail = "·" },
  showmode = true, ---@type boolean
  showcmd = true, ---@type boolean
  fillchars = {
    foldopen = "",
    foldclose = "",
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
  -- foldtext = "v:lua.require'config.functions'.foldtext()", ---@type string -- set by LazyVim
  -- =============================================================================
  -- Other
  -- =============================================================================
  splitright = true, ---@type boolean
  splitbelow = true, ---@type boolean
  mouse = "n", ---@type "n" | "v" | "i" | "c" | "h" | "a" | "r"
  swapfile = false, ---@type boolean
  timeoutlen = 800, ---@type number
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
