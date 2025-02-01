local Settings = {
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight"
  statusline = "default", ---@type "default" | "lualine" | "off" | "simple"
  picker = "snacks", ---@type "snacks" | "fzf" | "telescope"
  completion = "blink", ---@type "blink" | "nvim-cmp" | "coc"
  cmp_engine = "luasnip", ---@type "off" | "luasnip"
  transparency = false, ---@type boolean
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
