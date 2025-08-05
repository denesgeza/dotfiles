vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = vim.opt
local TERM = vim.env.TERM

-- =============================================================================
-- UI
-- =============================================================================
vim.opt.winborder = 'single' ---@type "single" | "double" | "padded" | "solid" | "shadow" | "none"
vim.o.background = Settings.background == 'auto' and Functions.background() or Settings.background
opts.list = false
opts.listchars = { eol = '↲', trail = '·', tab = '» ', nbsp = '␣' }
opts.fillchars = { eob = ' ' }
opts.cmdheight = 0 ---@type 0 | 1 | 2 | 3
opts.showmode = true ---@type boolean
opts.showcmd = true ---@type boolean
opts.laststatus = 3 ---@type 0 | 1 | 2 | 3 -- 0: never, 1: only if more than one window, 2: makes it buffer-local, 3: buffer-global
vim.o.updatetime = 250
opts.timeoutlen = 500 ---@type number
opts.conceallevel = 2 ---@type number
opts.number = true
opts.relativenumber = true ---@type boolean
opts.linespace = 1 ---@type number
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
-- opts.colorcolumn = "120"
-- =============================================================================
-- Indent, spacing
-- =============================================================================
opts.autoindent = true
opts.breakindent = true
opts.expandtab = true ---@type boolean
opts.cindent = true ---@type boolean
opts.smarttab = true ---@type boolean
vim.o.scrolloff = 6 ---@type number
opts.sidescrolloff = 6 ---@type number
opts.wrap = false ---@type boolean
-- =============================================================================
-- Folding
-- =============================================================================
opts.foldmethod = 'expr' ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"

vim.o.foldexpr = "v:lua.require'config.functions'.foldexpr()" ---@type string
opts.smoothscroll = TERM == 'xterm-kitty' and false or true ---@type boolean
opts.foldlevel = 99 ---@type number
opts.foldlevelstart = 99 ---@type number
opts.foldenable = false ---@type boolean
-- =============================================================================
-- Completion
-- =============================================================================
vim.o.complete = '.,o' -- use buffer and omnifunc
vim.o.completeopt = 'fuzzy,menuone,noselect' -- add 'popup' for docs (sometimes)
vim.o.autocomplete = true
vim.o.pumheight = 7
vim.cmd 'set completeopt+=noselect'
-- =============================================================================
-- Other
-- =============================================================================
opts.grepprg = 'rg --vimgrep'
opts.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }
opts.grepformat = '%f:%l:%c:%m'
opts.splitright = true ---@type boolean
opts.splitbelow = true ---@type boolean
vim.o.confirm = true
vim.o.inccommand = 'split'
opts.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- Enables mouse support for different modes (see :h mouse)
opts.mouse = 'a' ---@type "n" | "nv" | "v" | "i" | "c" | "h" | "a" | "r"
opts.swapfile = false ---@type boolean
vim.o.undofile = true -- Save undo history
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

opts.wildignore = {
  '*.o',
  '*.obj,*~',
  '*.git*',
  '*.meteor*',
  '*vim/backups*',
  '*sass-cache*',
  '*mypy_cache*',
  '*__pycache__*',
  '*cache*',
  '*logs*',
  '*node_modules*',
  '**/node_modules/**',
  '*DS_Store*',
  '*.gem',
  'log/**',
  'tmp/**',
  '*package-lock.json*',
  '**/dist/**',
  '**/.next/**',
  '**/.nx/**',
  -- hide default color themes from Theme Selector
  'blue.vim',
  'darkblue.vim',
  'delek.vim',
  'elflord.vim',
  'evening.vim',
  'desert.vim',
  'habamax.vim',
  'industry.vim',
  'koehler.vim',
  'lunaperche.vim',
  'morning.vim',
  'murphy.vim',
  'pablo.vim',
  'peachpuff.vim',
  'retrobox.vim',
  'ron.vim',
  'slate.vim',
  'sorbet.vim',
  'shine.vim',
  'quiet.vim',
  'torte.vim',
  'vim.vim',
  'wildcharm.vim',
  'zaibatsu.vim',
  'zellner.vim',
}
-- =============================================================================
-- LazyVim options
-- =============================================================================
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }
vim.deprecate = function() end
vim.g.trouble_lualine = true
vim.g.ai_cmp = Settings.ai_cmp
-- =============================================================================

-- =============================================================================
-- Globals
-- =============================================================================
-- vim.g.python3_host_prog = "/usr/local/bin/python3.11"
vim.g.python3_host_prog = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.opt.spellfile = vim.fn.expand '~/.config/nvim/spell/custom.utf-8.add'
-- =============================================================================
-- LATEX SETTINGS
-- =============================================================================
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_context_pdf_viewer = 'skim'
vim.g.vimtex_view_skim_reading_bar = 1
vim.g.vimtex_view_skim_no_select = 0
-- Indentation
vim.g.vimtex_indent_enabled = true
vim.g.vimtex_indent_sections = true
-- Folding
vim.g.vimtex_fold_enabled = true
vim.g.vimtex_fold_bib_enabled = true
-- vim.g["tex_flavor"] = "latex" -- how to read tex files
-- vim.g["tex_indent_items"] = 0 -- turn off enumerate indent
-- vim.g["tex_indent_brace"] = 0 -- turn off brace indent
-- -- vim.g["vimtex_context_pdf_viewer"] = "okular" -- external PDF viewer run from vimtex menu command
vim.g.vimtex_log_ignore = { -- Error suppression:
  'Underfull',
  'Overfull',
  'specifier changed to',
  'Token not allowed in a PDF string',
}
vim.g.vimtex_mappings_enabled = true
vim.g.vimtex_quickfix_ignore_filters = { 'Overfull', 'Underfull', 'specifier changed to', 'Token not allowed in a PDF string' }
-- =============================================================================
