local Manager = {
  -- {{{ Settings
  transparency = false, ---@type boolean
  -- default keyboard layout is "colemak" some keymaps may need remapping for qwerty
  keyboard = "colemak", ---@type "qwerty" | "colemak" -- NOTE: Qwerty is not updated
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "github" | "tundra"
  statusline = "off", ---@type "default" | "lualine" | "off" | "simple"
  explorer = "telescope", ---@type "fzf" | "telescope" Managed by lazyvim
  cmp = "native", ---@type "luasnip" | "native" -- activate, deactivate also on LazyExtras
  notifications = "nvim-notify", ---@type "off" | "nvim-notify" | "fidget" -- disables `fidget`
  -- }}}
  ---@type table<string, {enabled: boolean, defaults: boolean}>
  plugins = {
    -- Coding {{{
    ["bigfile"] = { enabled = false },
    ["conform"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["compiler"] = { enabled = false },
    ["copilot-cmp"] = { enabled = true },
    ["hardtime"] = { enabled = false },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["nvim-dap"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["vim-visual-multi"] = { enabled = true },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = false },
    ["cyberdream"] = { enabled = false },
    ["github"] = { enabled = false },
    ["kanagawa"] = { enabled = false },
    ["rose-pine"] = { enabled = false },
    ["tokyonight"] = { enabled = true },
    -- }}}
    -- Editor {{{
    ["dadbod"] = { enabled = true },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["indent-blankline"] = { enabled = true },
    ["oil"] = { enabled = false },
    ["neogit"] = { enabled = false },
    ["neorg"] = { enabled = true },
    ["neo-tree"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["mini.files"] = { enabled = true },
    ["mini.clue"] = { enabled = true },
    ["mini.align"] = { enabled = true },
    ["telescope"] = { enabled = false },
    ["toggleterm"] = { enabled = false },
    ["fzf-lua"] = { enabled = true },
    ["lazygit"] = { enabled = true },
    ["spectre"] = { enabled = false },
    ["visual-surround"] = { enabled = false },
    ["which-key"] = { enabled = false },
    -- }}}
    -- LSP {{{
    ["typescript-tools"] = { enabled = false },
    ["ts-error-translator"] = { enabled = false },
    -- }}}
    -- Testing {{{
    ["neotest"] = { enabled = true },
    -- }}}
    -- UI {{{
    ["bufferline"] = { enabled = true },
    ["fidget"] = { enabled = true },
    ["fold-line"] = { enabled = false },
    ["headlines"] = { enabled = false },
    ["lualine"] = { enabled = false, defaults = false },
    ["markview"] = { enabled = true },
    ["mini.icons"] = { enabled = true },
    ["nerdy"] = { enabled = false }, -- Nerd Font icons lookup
    ["noice"] = { enabled = false, defaults = false },
    ["nvim-notify"] = { enabled = true },
    ["virt-column"] = { enabled = true },
    -- }}}
  },
}

return Manager
