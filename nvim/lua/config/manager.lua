local Manager = {
  -- {{{ Settings
  transparency = true, ---@type boolean
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "github"
  statusline = "default", ---@type "default" | "lualine" | "off"
  explorer = "telescope", ---@type "fzf" | "telescope" Managed by lazyvim
  completion = "blink", ---@type "blink" | "cmp"
  cmp = "native", ---@type "luasnip" | "native" -- activate, deactivate also on LazyExtras
  notifications = "snacks", ---@type "off" | "snacks" | "fidget" -- disables `fidget`
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
    ["hardtime"] = { enabled = false },
    ["nvim-dap"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["molten"] = { enabled = false }, -- Jupyter notebooks
    ["vim-visual-multi"] = { enabled = true },
    ["quarto"] = { enabled = false },
    -- }}}
    -- Colorscheme {{{
    ["catppuccin"] = { enabled = false },
    ["github"] = { enabled = false },
    ["kanagawa"] = { enabled = true },
    ["rose-pine"] = { enabled = true },
    ["tokyonight"] = { enabled = false },
    -- }}}
    -- Editor {{{
    ["dadbod"] = { enabled = true },
    ["diffview"] = { enabled = true },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["oil"] = { enabled = false },
    ["neogit"] = { enabled = false },
    ["neorg"] = { enabled = true },
    ["neo-tree"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["mini.files"] = { enabled = true },
    ["mini.clue"] = { enabled = false },
    ["mini.align"] = { enabled = true },
    ["telescope"] = { enabled = false },
    ["toggleterm"] = { enabled = false },
    ["fzf-lua"] = { enabled = true },
    ["lazygit"] = { enabled = true },
    ["spectre"] = { enabled = false },
    ["visual-surround"] = { enabled = false },
    ["which-key"] = { enabled = true },
    -- }}}
    -- LSP {{{
    ["typescript-tools"] = { enabled = false },
    ["ts-error-translator"] = { enabled = false },
    -- }}}
    -- Testing {{{
    ["neotest"] = { enabled = false },
    ["telescope-simulators"] = { enabled = true },
    -- }}}
    -- UI {{{
    ["bufferline"] = { enabled = true },
    ["fidget"] = { enabled = true },
    ["fold-line"] = { enabled = false },
    ["headlines"] = { enabled = false },
    ["lualine"] = { enabled = false, defaults = false },
    ["markview"] = { enabled = true },
    ["mini.icons"] = { enabled = true },
    ["nerdy"] = { enabled = true }, -- Nerd Font icons lookup
    ["noice"] = { enabled = false, defaults = false },
    ["snacks"] = { enabled = true },
    ["statuscolumn"] = { enabled = false },
    ["virt-column"] = { enabled = false },
    -- }}}
    -- Languages {{{
    ["vimtex"] = { enabled = true },
    -- }}}
  },
}

return Manager
