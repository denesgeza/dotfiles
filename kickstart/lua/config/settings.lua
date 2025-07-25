---@alias SeparatorType "block" | "slant" | "circle" | "triangle"
---@alias NeovideVfxMode "ripple" | "pixiedust" | "torpedo" | "wireframe" | "railgun" | ""
---@alias Colorscheme "kanagawa" | "catppuccin" | "default" | "rose-pine" | "everforest" | "gruvbox-material" | "geza"
---@alias Background "dark" | "light" | "auto"
---@alias StatuslineVariants "default" | "off" | "simple"
---@alias Icons "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
---@alias Picker "fzf" | "telescope" | "snacks"

local Settings = {
  colorscheme = 'geza', ---@type Colorscheme
  background = 'dark', ---@type Background
  transparency = true, ---@type boolean
  highlights = 'default', ---@type "default" | "on" | "off" -- "off" breaks statusline
  tabline = true, ---@type boolean
  icons = 'mini-icons', ---@type Icons
  picker = 'snacks', ---@type Picker
  completion = 'blink', ---@type "blink" | "native"
  snippets_engine = 'luasnip', ---@type "luasnip" | "native"
  notifications = 'snacks', ---@type "off" | "snacks"
  keyboard = 'qwerty', ---@type "qwerty" | "colemak"
  AI = true, ---@type boolean
  ai_cmp = false, ---@type boolean
  statusline = {
    style = 'default', ---@type StatuslineVariants
    separators = 'slant', ---@type SeparatorType
  },
  neovide = {
    vfx_mode = 'railgun', ---@type NeovideVfxMode
    theme = 'dark', ---@type Background
    separators = 'block', ---@type SeparatorType
  },
  ---@type table<string, boolean>
  snacks = {
    explorer = true,
    dashboard = true,
    input = true,
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
