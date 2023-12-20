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
  laststatus = 3, ---@type 0 | 1 | 2 | 3 -- 0: never, 1: only if more than one window, 2: makes it buffer-local, 3: buffer-global
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
  foldlevelstart = 5, ---@type number
  foldenable = true, ---@type boolean
  fillchars = {
    fold = " ",
    foldopen = "",
    foldclose = "",
    eob = " ",
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
    -- hide default color themes from Theme Selector
    "blue.vim",
    "darkblue.vim",
    "delek.vim",
    "elflord.vim",
    "evening.vim",
    "desert.vim",
    "habamax.vim",
    "industry.vim",
    "koehler.vim",
    "lunaperche.vim",
    "morning.vim",
    "murphy.vim",
    "pablo.vim",
    "peachpuff.vim",
    "retrobox.vim",
    "ron.vim",
    "slate.vim",
    "sorbet.vim",
    "shine.vim",
    "quiet.vim",
    "torte.vim",
    "vim.vim",
    "wildcharm.vim",
    "zaibatsu.vim",
    "zellner.vim",
  },
}
-- =============================================================================
-- Globals
-- =============================================================================

vim.g.python3_host_prog = "/usr/bin/python3.11"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

for k, v in pairs(options) do
  vim.opt[k] = v
end
