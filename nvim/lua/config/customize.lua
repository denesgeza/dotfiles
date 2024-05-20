local Customize = {}

Customize = {
  -- {{{ Settings
  transparency = true, ---@type boolean
  -- default keyboard layout is "colemak" some keymaps may need remapping in qwerty
  keyboard = "colemak", ---@type "qwerty" | "colemak"
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "github" | "tundra"
  statusline = "fancy", ---@type "simple" | "fancy"
  cmp = "luasnip", ---@type "luasnip" | "native"
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
    ["luasnip"] = { enabled = false },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["indent-blankline"] = { enabled = true },
    ["conform"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["Copilot"] = { enabled = true },
    ["Copilot-cmp"] = { enabled = true },
    ["fidget.nvim"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true },
    ["mini.surround"] = { enabled = false },
    ["mini.files"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["spectre"] = { enabled = false },
    ["neotest"] = { enabled = true },
    -- }}}
    -- {{{ Utilities
    ["CopilotChat"] = { enabled = false },
    ["toggleterm.nvim"] = { enabled = true },
    ["neorg"] = { enabled = true }, -- `Lazy build neorg` if build errors
    ["dadbod"] = { enabled = true },
    ["bigfile"] = { enabled = false },
    ["mini.clue"] = { enabled = false },
    ["mini-bufremove"] = { enabled = true },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["octo"] = { enabled = false },
    ["vim-visual-multi"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["visual-surround"] = { enabled = false },
    ["neogit"] = { enabled = true },
    -- TS
    ["typescript-tools"] = { enabled = true },
    ["ts-error-translator"] = { enabled = false },
    -- PYTHON
    ["quarto"] = { enabled = false },
    ["compiler.nvim"] = { enabled = false },
    ["molten.nvim"] = { enabled = false }, -- Jupyter notebooks
    -- {{{ Colorscheme
    ["catppuccin"] = { enabled = false },
    ["kanagawa"] = { enabled = false },
    ["tokyonight"] = { enabled = false },
    ["github"] = { enabled = false },
    ["rose-pine"] = { enabled = true },
    ["tundra"] = { enabled = false },
    ["cyberdream"] = { enabled = true },
    -- }}}
  },
}
-- }}}

return Customize
