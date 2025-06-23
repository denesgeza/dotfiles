---@alias SeparatorType "block" | "slant" | "circle" | "triangle"
---@alias NeovideVfxMode "ripple" | "pixiedust" | "torpedo" | "wireframe" | "railgun" | ""
---@alias Colorscheme "kanagawa" | "catppuccin" | "default" | "rose-pine" | "everforest" | "gruvbox-material" | "geza" | "kanso"
---@alias Background "dark" | "light" | "auto"
---@alias StatuslineVariants "default" | "lualine" | "off" | "simple"
---@alias Icons "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
---@alias Picker "fzf" | "telescope" | "snacks"

local Settings = {
  colorscheme = "geza", ---@type Colorscheme
  background = "light", ---@type Background
  transparency = true, ---@type boolean
  highlights = "default", ---@type "default" | "on" | "off" -- "off" breaks statusline
  tabline = true, ---@type boolean
  icons = "mini-icons", ---@type Icons
  picker = "snacks", ---@type Picker
  completion = "blink", ---@type "blink" | "nvim-cmp" | "native"
  snippets_engine = "luasnip", ---@type "luasnip" | "native"
  notifications = "snacks", ---@type "off" | "snacks"
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  AI = true, ---@type boolean
  ai_cmp = false, ---@type boolean
  statusline = {
    style = "default", ---@type StatuslineVariants
    separators = "slant", ---@type SeparatorType
  },
  neovide = {
    vfx_mode = "railgun", ---@type NeovideVfxMode
    theme = "dark", ---@type Background
    separators = "block", ---@type SeparatorType
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
    image = false,
  },
}

return Settings
