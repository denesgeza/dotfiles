local Settings = {
  ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "everforest" | "gruvbox-material" | "geza" | "kanso"
  colorscheme = "geza",
  background = "dark", ---@type "dark" | "light"
  transparency = true, ---@type boolean
  highlights = "default", ---@type "default" | "on" | "off" -- "off" breaks statusline
  tabline = true, ---@type boolean
  icons = "mini-icons", ---@type "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
  picker = "snacks", ---@type "snacks" | "fzf" | "telescope"
  completion = "blink", ---@type "blink" | "nvim-cmp" | "native"
  snippets_engine = "luasnip", ---@type "luasnip" | "native"
  notifications = "snacks", ---@type "off" | "snacks" | "fidget"
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  AI = true, ---@type boolean
  ai_cmp = false, ---@type boolean
  statusline = {
    style = "default", ---@type "default" | "lualine" | "off" | "simple"
    separators = "slant", ---@type "block" | "slant" | "circle"
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
    scroll = false,
    statuscolumn = true,
    quickfile = true,
    terminal = true,
    words = true,
    image = true,
  },
}

return Settings
