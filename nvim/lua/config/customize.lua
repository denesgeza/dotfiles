local Customize = {}

Customize = {
  -- {{{ Settings
  transparency = false, ---@type boolean
  -- default keyboard layout is "colemak" some keymaps may need remapping in qwerty
  keyboard = "colemak", ---@type "qwerty" | "colemak"
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "github"
  statusline = "simple", ---@type "simple" | "fancy"
  -- }}}
  -- {{{ Plugins
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- {{{ Builtins
    ["neo-tree"] = { enabled = true },
    ["bufferline"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["nvim-notify"] = { enabled = false },
    ["noice.nvim"] = { enabled = false, defaults = false },
    ["lualine"] = { enabled = false, defaults = false },
    ["luasnip"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["indent-blankline"] = { enabled = false },
    ["conform"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["Copilot"] = { enabled = true },
    ["Copilot-cmp"] = { enabled = true },
    ["fidget.nvim"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true },
    ["mini.surround"] = { enabled = false },
    ["mini.comment"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["spectre"] = { enabled = false },
    ["neotest"] = { enabled = true },
    -- }}}
    -- {{{ Utilities
    ["toggleterm.nvim"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["tmux-navigator"] = { enabled = false },
    ["dadbod"] = { enabled = false },
    ["bigfile"] = { enabled = false },
    ["mini.pick"] = { enabled = false },
    ["mini.files"] = { enabled = true },
    ["mini.clue"] = { enabled = false },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["octo"] = { enabled = false },
    ["vim-visual-multi"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["vim-doge"] = { enabled = false },
    ["visual-surround"] = { enabled = true },
    -- TS
    ["typescript-tools"] = { enabled = true },
    -- PYTHON
    ["quarto"] = { enabled = false },
    ["compiler.nvim"] = { enabled = true },
    ["molten.nvim"] = { enabled = false }, -- Jupyter notebooks
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = false },
    ["kanagawa"] = { enabled = true },
    ["tokyonight"] = { enabled = false },
    ["github"] = { enabled = false },
    ["rose-pine"] = { enabled = true },
    -- }}}
  },
}
-- }}}

return Customize
