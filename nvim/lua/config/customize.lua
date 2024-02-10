local Customize = {}

Customize = {
  -- {{{ Settings
  transparency = false, ---@type boolean
  keyboard = "colemak", ---@type "qwerty" | "colemak"
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine"
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
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["lualine"] = { enabled = false, defaults = false },
    ["luasnip"] = { enabled = true },
    ["luasnip-snippets"] = { enabled = false },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["indent-blankline"] = { enabled = false },
    ["conform"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["Copilot"] = { enabled = true },
    ["Copilot-cmp"] = { enabled = true },
    ["fidget.nvim"] = { enabled = false },
    ["gitsigns.nvim"] = { enabled = true },
    ["mini.surround"] = { enabled = false },
    ["mini.comment"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["spectre"] = { enabled = false },
    -- }}}
    -- {{{ Utilities
    ["toggleterm.nvim"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["tmux-navigator"] = { enabled = false },
    ["dadbod"] = { enabled = true },
    ["bigfile"] = { enabled = false },
    ["harpoon"] = { enabled = false },
    ["mini.clue"] = { enabled = false },
    ["mini.pick"] = { enabled = false },
    ["mini.files"] = { enabled = true },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["octo"] = { enabled = false },
    ["vim-visual-multi"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["vim-doge"] = { enabled = false },
    ["quarto"] = { enabled = false },
    ["reactive"] = { enabled = false },
    ["visual-surround"] = { enabled = true },
    ["rainbow-delimiters"] = { enabled = false },
    -- TS
    ["typescript-tools"] = { enabled = true },
    ["tsc"] = { enabled = false },
    -- PYTHON
    ["compiler.nvim"] = { enabled = false },
    ["molten.nvim"] = { enabled = false }, -- Jupyter notebooks
    -- RUST
    ["rustacean"] = { enabled = true },
    -- }}}
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = false },
    ["kanagawa"] = { enabled = true },
    ["tokyonight"] = { enabled = false },
    ["gruvbox"] = { enabled = false },
    ["github"] = { enabled = false },
    ["base16"] = { enabled = false },
    ["rose-pine"] = { enabled = true },
    -- }}}
  },
}
-- }}}

return Customize
