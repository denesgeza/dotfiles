local Manager = {
  -- {{{ Settings
  transparency = false, ---@type boolean
  -- default keyboard layout is "colemak" some keymaps may need remapping in qwerty
  keyboard = "colemak", ---@type "qwerty" | "colemak"
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "github" | "tundra"
  statusline = "default", ---@type "default" | "lualine" | "none" | "simple"
  explorer = "fzf", ---@type "fzf" | "telescope" Managed by lazyvim
  cmp = "native", ---@type "luasnip" | "native"
  -- }}}
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ["bigfile"] = { enabled = false },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["nvim-dap"] = { enabled = true },
    ["conform"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["compiler"] = { enabled = false },
    ["copilot-cmp"] = { enabled = true },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["nvim-lint"] = { enabled = false },
    ["vim-visual-multi"] = { enabled = false },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = false },
    ["cyberdream"] = { enabled = false },
    ["github"] = { enabled = false },
    ["kanagawa"] = { enabled = true },
    ["rose-pine"] = { enabled = true },
    ["tokyonight"] = { enabled = false },
    -- }}}
    -- Editor {{{
    ["dadbod"] = { enabled = true },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["indent-blankline"] = { enabled = true },
    ["neogit"] = { enabled = true },
    ["neorg"] = { enabled = true }, -- `Lazy build neorg` if build errors
    ["neo-tree"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["mini.files"] = { enabled = true },
    ["mini.clue"] = { enabled = false },
    ["telescope"] = { enabled = false },
    ["toggleterm"] = { enabled = false },
    ["fzf-lua"] = { enabled = true },
    ["lazygit"] = { enabled = true },
    ["spectre"] = { enabled = false },
    ["visual-surround"] = { enabled = false },
    ["which-key"] = { enabled = true },
    -- }}}
    -- LSP {{{
    ["typescript-tools"] = { enabled = true },
    ["ts-error-translator"] = { enabled = false },
    -- }}}
    -- Testing {{{
    ["neotest"] = { enabled = true },
    -- }}}
    -- UI {{{
    ["bufferline"] = { enabled = true },
    ["fidget"] = { enabled = true },
    ["headlines"] = { enabled = false },
    ["lualine"] = { enabled = false, defaults = false },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["noice"] = { enabled = false, defaults = false },
    ["nvim-notify"] = { enabled = false },
    -- }}}
  },
}

return Manager
