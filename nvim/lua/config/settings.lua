local Settings = {
  colorscheme = "everforest", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "shadow" | "everforest"
  highlights = "default", ---@type "default" | "on" | "off" -- "off" breaks statusline
  tabline = true, ---@type boolean
  transparency = true, ---@type boolean
  icons = "mini-icons", ---@type "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
  picker = "snacks", ---@type "snacks" | "fzf" | "telescope"
  completion = "blink", ---@type "blink" | "nvim-cmp" | "coc" | "lsp"
  cmp_engine = "luasnip", ---@type "off" | "luasnip"
  notifications = "snacks", ---@type "off" | "snacks" | "fidget"
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  ai_cmp = false, ---@type boolean
  statusline = {
    style = "test", ---@type "default" | "lualine" | "off" | "simple" | "test"
    separators = "circle", ---@type "block" | "slant" | "circle"
  },
  neovide = {
    vfx_mode = "railgun", ---@type "ripple" | "pixiedust" | "torpedo" | "wireframe" | "railgun"|  ""
    theme = "dark", ---@type "dark" | "light" | "auto"
    separators = "block", ---@type "block" | "slant" | "circle"
  },
  ---@type table<string, boolean>
  snacks = {
    explorer = true,
    dashboard = true,
    indent = true,
    rename = true,
    bufdelete = true,
    scroll = true,
    statuscolumn = true,
    quickfile = true,
    terminal = true,
    words = true,
    image = true,
  },
}

return Settings
