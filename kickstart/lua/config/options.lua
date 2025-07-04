local opts = vim.opt
local TERM = vim.env.TERM

vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = true

-- =============================================================================
-- UI
-- =============================================================================
-- vim.o.winborder = 'single' ---@type "single" | "double" | "padded" | "solid" | "shadow" | "none"
vim.o.background = Settings.background == 'auto' and Functions.background() or Settings.background
opts.list = false
opts.listchars = { eol = '↲', tab = '>-', trail = '·' }
opts.fillchars = { eob = ' ' }
opts.cmdheight = 0 ---@type 0 | 1 | 2 | 3
opts.showmode = true ---@type boolean
opts.showcmd = true ---@type boolean
opts.laststatus = 3 ---@type 0 | 1 | 2 | 3 -- 0: never, 1: only if more than one window, 2: makes it buffer-local, 3: buffer-global
opts.timeoutlen = 300 ---@type number
opts.conceallevel = 2 ---@type number
opts.relativenumber = true ---@type boolean
opts.linespace = 1 ---@type number
-- opts.colorcolumn = "120"
-- =============================================================================
-- Indent, spacing
-- =============================================================================
opts.autoindent = true
opts.expandtab = true ---@type boolean
opts.cindent = true ---@type boolean
opts.smarttab = true ---@type boolean
opts.scrolloff = 6 ---@type number
opts.sidescrolloff = 6 ---@type number
opts.wrap = false ---@type boolean
-- =============================================================================
-- Folding
-- =============================================================================
opts.foldmethod = 'expr' ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"

opts.smoothscroll = TERM == 'xterm-kitty' and false or true ---@type boolean
opts.foldlevel = 99 ---@type number
opts.foldlevelstart = 99 ---@type number
opts.foldenable = false ---@type boolean
-- =============================================================================
-- Other
-- =============================================================================
opts.grepprg = 'rg --vimgrep'
opts.grepformat = '%f:%l:%c:%m'
opts.splitright = true ---@type boolean
opts.splitbelow = true ---@type boolean
-- Enables mouse support for different modes (see :h mouse)
opts.mouse = 'a' ---@type "n" | "nv" | "v" | "i" | "c" | "h" | "a" | "r"
opts.swapfile = false ---@type boolean
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
vim.g.deprecation_warnings = false
vim.g.trouble_lualine = true
vim.g.markdown_recommended_style = 0
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
if vim.uv.os_uname().sysname:find 'Windows' ~= nil then
  vim.g.vimtex_view_method = 'SumatraPDF' ---@type "SumatraPDF" | "Okular"
elseif vim.fn.has 'macunix' == 1 then
  vim.g.vimtex_view_method = 'skim'
  vim.g.vimtex_context_pdf_viewer = 'skim'
  vim.g.vimtex_view_skim_reading_bar = 1
  vim.g.vimtex_view_skim_no_select = 0
else
  -- WSL
  local pdf_viewer = 'okular' ---@type "zathura" | "okular"

  if pdf_viewer == 'zathura' then
    vim.g.vimtex_context_pdf_viewer = 'zathura'
    vim.g.vimtex_view_forward_search_on_start = 'zathura'
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    -- vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    vim.g.vimtex_view_zathura_use_synctex = 1
  elseif pdf_viewer == 'okular' then
    vim.g.vimtex_view_general_viewer = 'okular'
    vim.g.vimtex_view_general_options = '--noraise --unique file:@pdf\\#src:@line@tex'
    vim.g.vimtex_view_general_options_latexmk = '--unique'
  end
end
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

-- =============================================================================
-- MANUALLY ENABLED LSPS
-- =============================================================================
-- vim.lsp.enable("ty")
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
