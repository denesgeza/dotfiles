local Settings = {
  colorscheme = "default", ---@type "kanagawa" | "catppuccin" |  "default" | "rose-pine" | "tokyonight" | "shadow"
  highlights = "on", ---@type "default" | "on" | "off" -- "off" breaks statusline
  statusline = "default", ---@type "default" | "lualine" | "off" | "simple"
  tabline = true, ---@type boolean
  transparency = false, ---@type boolean
  icons = "mini-icons", ---@type "nvim-web-devicons" | "nvim-devicons" | "mini-icons"
  picker = "snacks", ---@type "snacks" | "fzf" | "telescope"
  completion = "blink", ---@type "blink" | "nvim-cmp" | "coc" | "lsp"
  cmp_engine = "luasnip", ---@type "off" | "luasnip"
  notifications = "snacks", ---@type "off" | "snacks" | "fidget"
  keyboard = "qwerty", ---@type "qwerty" | "colemak"
  ai_cmp = false, ---@type boolean
  neovide = {
    vfx_mode = "railgun", ---@type "ripple" | "pixiedust" | "torpedo" | "wireframe" | "railgun"|  ""
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
