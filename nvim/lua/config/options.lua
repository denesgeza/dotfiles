local functions = require("config.functions")
Is_Enabled = functions.is_enabled

local opts = vim.opt

-- =============================================================================
-- UI
-- =============================================================================
opts.list = false
opts.listchars = { eol = "↲", tab = ">-", trail = "·" }
opts.cmdheight = 1 ---@type 0 | 1 | 2
opts.showmode = true ---@type boolean
opts.showcmd = true ---@type boolean
-- statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T",
opts.laststatus = 0 ---@type 0 | 1 | 2 | 3 -- 0: never, 1: only if more than one window, 2: makes it buffer-local, 3: buffer-global
opts.timeoutlen = 300 ---@type number
-- =============================================================================
-- Indent, spacing
-- =============================================================================
opts.autoindent = true
opts.expandtab = true ---@type boolean
opts.cindent = true ---@type boolean
opts.smarttab = true ---@type boolean

-- =============================================================================
-- Folding
-- =============================================================================
opts.foldmethod = "expr" ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"

if vim.fn.has("nvim-0.10") == 1 then
  opts.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opts.smoothscroll = true ---@type boolean
  opts.foldtext = ""
end
opts.foldlevel = 0 ---@type number
opts.foldlevelstart = 99 ---@type number
opts.foldenable = true ---@type boolean
opts.fillchars = {
  fold = " ",
  -- foldopen = "",
  -- foldclose = "",
  foldopen = "-",
  foldclose = "+",
  eob = " ",
}
-- =============================================================================
-- Other
-- =============================================================================
opts.splitright = true ---@type boolean
opts.splitbelow = true ---@type boolean
-- Enables mouse support for different modes (see :h mouse)
opts.mouse = "nv" ---@type "n" | "nv" | "v" | "i" | "c" | "h" | "a" | "r"
opts.swapfile = false ---@type boolean
opts.wildignore = {
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
}
-- =============================================================================
-- Optionals
-- =============================================================================

-- =============================================================================
-- Globals
-- =============================================================================

vim.g.python3_host_prog = "/usr/local/bin/python3.11"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
