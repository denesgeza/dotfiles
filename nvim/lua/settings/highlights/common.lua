local get_color = require("config.functions").get_color

local H = {}
local c = {}

function H.set_highlights()
  c.normal_bg = get_color("Normal", "bg")
  c.normal_fg = get_color("Normal", "fg")
  c.hint_fg = get_color("DiagnosticHint", "fg")
  c.info_fg = get_color("DiagnosticInfo", "fg")
  c.warn_fg = get_color("DiagnosticWarn", "fg")
  c.error_fg = get_color("ErrorMsg", "fg")
  c.lazy_special_fg = get_color("Special", "fg")
  c.statusline_bg = get_color("StatusLine", "bg")
  c.comment_fg = get_color("Comment", "fg")
  c.comment_bg = get_color("Comment", "bg")
  c.cursoline_bg = get_color("CursorLine", "bg")
  c.cursoline_fg = get_color("CursorLine", "fg")
  c.boolean_fg = get_color("Boolean", "fg")
  c.pmenu_bg = get_color("Pmenu", "bg")

  if vim.g.colors_name == "default" then
    require("settings.highlights.default").default_colorscheme(c)
  end

  local theme = {
    transparent = {
      StatusLine = { bg = "NONE" },
      FloatBorder = { link = "Normal" },
      SnacksNotifierBorderInfo = { bg = "NONE" },
      SnacksNotifierBorderWarn = { bg = "NONE" },
      SnacksNotifierBorderError = { bg = "NONE" },
      SnacksNotifierBorderDebug = { bg = "NONE" },
      SnacksNotifierBorderTrace = { bg = "NONE" },
      Normal = {
        light = { bg = c.normal_bg, fg = c.normal_fg },
        dark = { fg = c.normal_fg, bg = "NONE", blend = 0 },
      },
      Pmenu = {
        light = { link = "Normal" },
        dark = { fg = c.normal_fg, bg = "NONE", blend = 0 },
      },
      PmenuSel = {
        dark = { fg = c.normal_fg, bg = c.cursoline_bg, blend = 0, reverse = true },
      },
      PmenuMatchSel = {
        dark = { fg = c.normal_fg, bg = "#908caa", blend = 0, reverse = true },
      },
      CursorLine = {
        dark = { bg = c.cursoline_bg, blend = 50 },
      },
      MiniFilesTitle = {
        dark = { fg = c.normal_fg, bg = "NONE", blend = 50 },
      },
      MiniFilesTitleFocused = {
        dark = { fg = c.boolean_fg, bg = "NONE", blend = 50 },
      },
      MiniFilesTitleFocusedInactive = {
        dark = { fg = c.boolean_fg, bg = "NONE", blend = 50 },
      },
      Comment = {
        light = { fg = c.comment_fg, bg = c.normal_bg, blend = 95 },
        dark = { fg = c.comment_fg, bg = "NONE", blend = 5, italic = true },
      },
    },
    opaque = {
      StatusLine = { link = "Normal" },
      StatusLineNC = { link = "Normal" },
      Pmenu = { link = "Normal" },
      PmenuSel = { fg = c.normal_fg, bg = c.cursoline_bg, reverse = true },
      PmenuMatchSel = { fg = c.normal_fg, bg = "#908caa", reverse = true },
      FloatBorder = { fg = c.pmenu_bg, bg = c.normal_bg },
      Comment = { fg = c.comment_fg, bg = c.normal_bg, italic = true },
    },
    common = {
      StatusLineNC = { link = "Comment" },
      NormalFloat = { link = "Normal" },
      WinSeparator = { link = "Comment" },
      -- WhichKey
      WhichKey = { fg = "#b4637a" },
      WhichKeyDesc = { link = "Constant" },
      WhichKeyValue = { fg = "#ebbcba" },
      WhichKeySeparator = { fg = "#908caa" },
      WhichKeyFloat = { link = "NormalFloat" },
      WhichKeyGroup = { link = "String" },
      -- Snacks
      SnacksBackdrop = { bg = "NONE" },
      SnacksDashboardIcon = { fg = "NvimLightYellow" },
      SnacksDashboardDesc = { fg = "NvimLightGrey2" },
      SnacksDashboardKey = { fg = "NvimLightRed" },
      -- Bufferline
      BufferlineSeparatorVisible = { fg = "NvimLightGrey1" },
      BufferlineSeparatorSelected = { fg = "NvimLightGrey2" },
      -- Flash
      FlashLabel = { fg = "Red" },
    },
  }

  if Settings.transparency == true then
    vim.cmd("set winblend=80")
    vim.cmd("set pumblend=80")
    for hl, prop in pairs(theme.transparent) do
      if vim.o.background == "light" and prop.light then
        vim.api.nvim_set_hl(0, hl, prop.light)
      elseif prop.dark then
        vim.api.nvim_set_hl(0, hl, prop.dark)
      else
        vim.api.nvim_set_hl(0, hl, prop)
      end
    end
  else
    for hl, prop in pairs(theme.opaque) do
      if vim.o.background == "light" and prop.light then
        vim.api.nvim_set_hl(0, hl, prop.light)
      elseif prop.dark then
        vim.api.nvim_set_hl(0, hl, prop.dark)
      else
        vim.api.nvim_set_hl(0, hl, prop)
      end
    end
  end

  for hl, prop in pairs(theme.common) do
    vim.api.nvim_set_hl(0, hl, prop)
  end
end

-- }}}

return H
