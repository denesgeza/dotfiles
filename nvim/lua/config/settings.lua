local Settings = {
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "shadow"
  ---@type "default" | "on" | "off"
  -- "off" disables all highlights
  -- "on" sets my custom highlights"
  -- "default" uses the colorscheme's highlights
  highlights = "on", ---@type "default" | "on" | "off" -- "off" breaks statusline
  statusline = "default", ---@type "default" | "lualine" | "off" | "simple"
  transparency = false, ---@type boolean
  picker = "snacks", ---@type "snacks" | "fzf" | "telescope"
  completion = "blink", ---@type "blink" | "nvim-cmp" | "coc"
  cmp_engine = "luasnip", ---@type "off" | "luasnip"
  notifications = "snacks", ---@type "off" | "snacks" | "fidget"
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  ai_cmp = false, ---@type boolean
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
  },
}

return Settings
