local Manager = {
  -- {{{ Settings
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "github"
  statusline = "default", ---@type "default" | "lualine" | "off" | "simple"
  completion = "blink", ---@type "blink" | "cmp"
  cmp = "luasnip", ---@type "luasnip" | "native" -- activate, deactivate also on LazyExtras
  -- }}}
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ["blink"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["conform"] = { enabled = true },
    ["compiler"] = { enabled = false },
    ["codeium"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["nvim-dap"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["vim-visual-multi"] = { enabled = true },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = false },
    ["kanagawa"] = { enabled = false },
    ["rose-pine"] = { enabled = false },
    ["tokyonight"] = { enabled = false },
    -- }}}
    -- Editor {{{
    ["dadbod"] = { enabled = true },
    ["diffview"] = { enabled = false },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["neo-tree"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["mini.files"] = { enabled = true },
    ["mini.align"] = { enabled = false },
    ["which-key"] = { enabled = true },
    -- }}}
    -- Testing {{{
    ["neotest"] = { enabled = false },
    -- }}}
    -- UI {{{
    ["bufferline"] = { enabled = true },
    ["fidget"] = { enabled = true },
    ["lualine"] = { enabled = false, defaults = false },
    ["mini.icons"] = { enabled = true },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["noice"] = { enabled = false, defaults = false },
    ["snacks"] = { enabled = true },
    -- }}}
    -- Languages {{{
    ["vimtex"] = { enabled = true },
    ["venv-selector"] = { enabled = false },
    -- }}}
  },
}

return Manager
