local opts = vim.opt

opts.completeopt = "menu,menuone,noselect"
opts.confirm = true -- Confirm to save changes before exiting modified buffer
opts.formatoptions = "jcroqlnt" -- tcqj
opts.grepformat = "%f:%l:%c:%m"
opts.grepprg = "rg --vimgrep"
opts.ignorecase = true -- Ignore case
opts.inccommand = "nosplit" -- preview incremental substitute
opts.pumblend = 10 -- Popup blend
opts.pumheight = 10 -- Maximum number of entries in a popup
opts.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opts.shiftround = true -- Round indent
opts.shortmess:append({ W = true, I = true, c = true, C = true })
opts.sidescrolloff = 8 -- Columns of context
opts.spelllang = { "en" }
opts.splitkeep = "screen"
if not vim.g.vscode then
  opts.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
end
opts.undofile = true
opts.undolevels = 10000
opts.updatetime = 200 -- Save swap file and trigger CursorHold
opts.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opts.wildmode = "longest:full,full" -- Command-line completion mode
opts.winminwidth = 5 -- Minimum window width
opts.wrap = false -- Disable line wrap
-- =============================================================================
-- UI
-- =============================================================================
opts.relativenumber = true
opts.number = true
opts.background = "dark" -- colorschemes that can be light or dark will be made dark
opts.signcolumn = "yes" -- show sign column so that text doesn't shift
opts.cursorline = true -- Enable highlighting of the current line
opts.wrap = false
opts.termguicolors = true
opts.list = false
opts.listchars = { eol = "↲", tab = ">-", trail = "·" }
opts.fillchars = { eob = " " }
opts.cmdheight = 1 ---@type 0 | 1 | 2
opts.showmode = true ---@type boolean
opts.showcmd = true ---@type boolean
-- statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T",
opts.laststatus = 0 ---@type 0 | 1 | 2 | 3 -- 0: never, 1: only if more than one window, 2: makes it buffer-local, 3: buffer-global
opts.timeoutlen = 300 ---@type number
opts.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- split windows
opts.splitright = true -- split vertical window to the right
opts.splitbelow = true -- split horizontal window to the bottom
-- =============================================================================
-- Indent, spacing
-- =============================================================================
-- tabs & indentation
opts.tabstop = 2 -- 2 spaces for tabs (prettier default)
opts.shiftwidth = 2 -- 2 spaces for indent width
opts.expandtab = true -- expand tab to spaces
opts.autoindent = true -- copy indent from current line when starting new one
opts.cindent = true ---@type boolean
opts.smarttab = true ---@type boolean
opts.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- =============================================================================
-- Folding
-- =============================================================================
opts.foldmethod = "expr" ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"

if vim.fn.has("nvim-0.10") == 1 then
  opts.smoothscroll = true ---@type boolean
end
opts.foldlevel = 0 ---@type number
opts.foldlevelstart = 99 ---@type number
opts.foldenable = true ---@type boolean
-- =============================================================================
-- Other
-- =============================================================================
opts.autowrite = true
-- clipboard
opts.clipboard:append("unnamedplus") -- use system clipboard as default register

-- turn off swapfile
opts.swapfile = false
-- search settings
opts.ignorecase = true -- ignore case when searching
opts.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opts.grepprg = "rg --vimgrep"
opts.grepformat = "%f:%l:%c:%m"
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
-- Globals
-- =============================================================================
vim.g.python3_host_prog = "/usr/local/bin/python3.11"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.db_ui_icons = {
  expanded = "",
  collapsed = "",
  saved_query = "*",
  new_query = "+",
  tables = "~",
  buffers = "»",
  connection_ok = "✓",
  connection_error = "✕",
}