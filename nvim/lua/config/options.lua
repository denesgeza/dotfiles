vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = vim.opt

-- =============================================================================
-- UI
-- =============================================================================
vim.o.winborder = "single" ---@type "single" | "double" | "padded" | "solid" | "shadow" | "none"
vim.o.background = Settings.background
opts.list = false
opts.listchars = { eol = "↲", tab = ">-", trail = "·" }
opts.fillchars = { eob = " " }
opts.cmdheight = 0 ---@type 0 | 1 | 2 | 3
opts.showmode = true ---@type boolean
opts.showcmd = true ---@type boolean
opts.laststatus = 3 ---@type 0 | 1 | 2 | 3 -- 0: never, 1: only if more than one window, 2: makes it buffer-local, 3: buffer-global
opts.timeoutlen = 300 ---@type number
opts.conceallevel = 2 ---@type number
opts.relativenumber = true ---@type boolean
opts.linespace = 1 ---@type number
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
opts.foldmethod = "expr" ---@type "indent" | "expr" | "manual" | "marker" | "syntax"| "diff"

opts.smoothscroll = true ---@type boolean
opts.foldlevel = 99 ---@type number
opts.foldlevelstart = 99 ---@type number
opts.foldenable = false ---@type boolean
-- =============================================================================
-- Other
-- =============================================================================
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
-- LazyVim options
-- =============================================================================
vim.g.lazyvim_python_lsp = "basedpyright" ---@type "pyright" | "basedpyright"
vim.g.lazyvim_python_ruff = "ruff" ---@type "ruff" | "ruff_lsp"
vim.g.lazygit_config = true ---@type boolean --to use lazyvim colorscheme
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.deprecation_warnings = false
vim.g.trouble_lualine = true
vim.g.markdown_recommended_style = 0
vim.g.ai_cmp = Settings.ai_cmp
vim.g.lazyvim_blink_main = true -- rust needs to be installed NOT Necessary anymore
vim.g.lazyvim_picker = Settings.picker
-- =============================================================================

-- =============================================================================
-- Globals
-- =============================================================================
-- vim.g.python3_host_prog = "/usr/local/bin/python3.11"
vim.g.python3_host_prog = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- =============================================================================
-- LATEX SETTINGS
-- =============================================================================
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.g.vimtex_view_method = "SumatraPDF" ---@type "SumatraPDF" | "Okular"
elseif vim.fn.has("macunix") == 1 then
  vim.g.vimtex_view_method = "skim"
  vim.g.vimtex_context_pdf_viewer = "skim"
  vim.g.vimtex_view_skim_reading_bar = 1
  vim.g.vimtex_view_skim_no_select = 0
else
  local pdf_viewer = "okular" ---@type "zathura" | "okular"

  if pdf_viewer == "zathura" then
    vim.g.vimtex_context_pdf_viewer = "zathura"
    vim.g.vimtex_view_forward_search_on_start = "zathura"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    -- vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    vim.g.vimtex_view_zathura_use_synctex = 1
  elseif pdf_viewer == "okular" then
    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_view_general_options = "--noraise --unique file:@pdf\\#src:@line@tex"
    vim.g.vimtex_view_general_options_latexmk = "--unique"
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
  "Underfull",
  "Overfull",
  "specifier changed to",
  "Token not allowed in a PDF string",
}
vim.g.vimtex_mappings_enabled = true
vim.g.vimtex_quickfix_ignore_filters =
  { "Overfull", "Underfull", "specifier changed to", "Token not allowed in a PDF string" }
-- =============================================================================
