---@alias SeparatorType "block" | "slant" | "circle" | "triangle"
---@alias NeovideVfxMode "ripple" | "pixiedust" | "torpedo" | "wireframe" | "railgun" | ""
---@alias ColorScheme "kanagawa" | "default" | "rose-pine" | "everforest" | "gruvbox-material" | "geza"
---@alias Background "dark" | "light"
---@alias StatuslineVariants "on" | "off"
---@alias Icons "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
---@alias Picker "fzf" | "telescope" | "snacks"

local background = require('config.functions').get_terminal_info().background
local term = require('config.functions').get_terminal_info().terminal

-- print(require('config.functions').get_terminal_info().background)
-- print(vim.env.NVIM_KITTY_BG_COLOR)

local Settings = {
  colorscheme = 'geza', ---@type ColorScheme
  background = background,
  transparency = true, ---@type boolean
  highlights = 'default', ---@type "default" | "on" | "off" -- "off" breaks statusline
  tabline = true, ---@type boolean
  icons = 'mini-icons', ---@type Icons
  picker = 'snacks', ---@type Picker
  completion = 'blink', ---@type "blink" | "native"
  snippets_engine = 'luasnip', ---@type "luasnip" | "native"
  notifications = 'fidget', ---@type "off" | "snacks" | "fidget"
  keyboard = 'qwerty', ---@type "qwerty" | "colemak"
  AI = true, ---@type boolean
  ai_cmp = false, ---@type boolean
  statusline = {
    style = 'on', ---@type StatuslineVariants
    separators = 'slant', ---@type SeparatorType
  },
  neovide = {
    vfx_mode = 'torpedo', ---@type NeovideVfxMode
  },
  snacks = {
    explorer = true,
    dashboard = true,
    input = true,
    indent = {
      enabled = true,
      scope = false,
      chunk = false,
    },
    rename = true,
    bufdelete = true,
    scroll = term == 'ghostty',
    statuscolumn = true,
    quickfile = true,
    terminal = true,
    words = true,
    image = true,
  },
}

return Settings
