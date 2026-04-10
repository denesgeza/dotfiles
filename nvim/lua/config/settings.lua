---@alias SeparatorType "block" | "slant" | "circle" | "triangle"
---@alias NeovideVfxMode "ripple" | "pixiedust" | "torpedo" | "wireframe" | "railgun"
---@alias ColorScheme "kanagawa" | "default" | "rose-pine" | "everforest" | "gruvbox-material" | "geza" | "koda"
---@alias Background "dark" | "light" | "auto" | "unknown"
---@alias OnOff "on" | "off"
---@alias Icons "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
---@alias Picker "fzf" | "telescope" | "snacks"

local background = require('config.functions').get_terminal_info().background
local term = require('config.functions').get_terminal_info().terminal

-- print(require('config.functions').get_terminal_info().background)
-- print(vim.env.NVIM_KITTY_BG_COLOR)

local Settings = {
  colorscheme = 'geza', ---@type ColorScheme
  -- background = background,
  background = 'dark',
  transparency = false, ---@type boolean
  highlights = 'default', ---@type "default" | "on" | "off" -- "off" breaks statusline
  tabline = true, ---@type boolean
  icons = 'mini-icons', ---@type Icons
  picker = 'snacks', ---@type Picker
  completion = 'blink', ---@type "blink" | "native"
  snippets_engine = 'luasnip', ---@type "luasnip" | "native"
  notifications = 'off', ---@type "off" | "snacks" | "fidget"
  keyboard = 'qwerty', ---@type "qwerty" | "colemak"
  AI = true, ---@type boolean
  ai_cmp = false, ---@type boolean
  surround = 'nvim-surround', ---@type "nvim-surround" | "mini-surround"
  statusline = {
    type = 'default', ---@type "default" | "floating"
    style = 'off', ---@type OnOff
    separators = 'slant', ---@type SeparatorType
  },
  neovide = {
    vfx_mode = 'torpedo', ---@type NeovideVfxMode
    hl_matching_paren = true, ---@type boolean
    theme = 'dark', ---@type "dark" | "light" | "auto" | "bg_color"
  },
  snacks = {
    explorer = true,
    dashboard = false,
    input = true,
    indent = {
      enabled = true,
      scope = true,
      chunk = true,
    },
    rename = true,
    bufdelete = true,
    scroll = term == 'ghostty',
    statuscolumn = true,
    quickfile = true,
    terminal = true,
    words = true,
    image = false,
  },
}

return Settings
