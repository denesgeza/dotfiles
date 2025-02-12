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

  -- Cmp highlights
  -- Transparent
  if Settings.transparency == true then
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderInfo", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderWarn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderError", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderDebug", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderTrace", { bg = "NONE" })
    if vim.o.background == "light" then
      vim.cmd("set winblend=80")
      vim.cmd("set pumblend=80")
      vim.api.nvim_set_hl(0, "Normal", { bg = c.normal_bg, fg = c.normal_fg })
      vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
      vim.api.nvim_set_hl(0, "Comment", { fg = c.comment_fg, bg = c.normal_bg, blend = 95 })
    else
      vim.api.nvim_set_hl(0, "Normal", { fg = c.normal_fg, bg = "NONE", blend = 0 })
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "Pmenu", { fg = c.normal_fg, bg = "NONE", blend = 0 })
      vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.normal_fg, bg = c.cursoline_bg, blend = 0, reverse = true })
      vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = c.normal_fg, bg = "#908caa", blend = 0, reverse = true })
      vim.api.nvim_set_hl(0, "Comment", { fg = c.comment_fg, bg = "NONE", blend = 5, italic = true })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = c.cursoline_bg, blend = 50 })
      vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = c.normal_fg, bg = "NONE", blend = 50 })
      vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { fg = c.boolean_fg, bg = "NONE", blend = 50 })
      vim.api.nvim_set_hl(0, "MiniFilesTitleFocusedInactive", { fg = c.boolean_fg, bg = "NONE", blend = 50 })
    end
  -- Opaque
  else
    -- vim.api.nvim_set_hl(0, "Normal", { fg = c.normal_fg, bg = c.normal_bg })
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.normal_fg, bg = c.cursoline_bg, reverse = true })
    vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = c.normal_fg, bg = "#908caa", reverse = true })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.pmenu_bg, bg = c.normal_bg })
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Comment", { fg = c.comment_fg, bg = c.normal_bg, italic = true })
  end

  vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Comment" })
  vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  vim.api.nvim_set_hl(0, "WinSeparator", { link = "Comment" })
  -- WhichKey {{{
  vim.api.nvim_set_hl(0, "WhichKey", { fg = "#b4637a" })
  vim.api.nvim_set_hl(0, "WhichKeyDesc", { link = "Constant" })
  vim.api.nvim_set_hl(0, "WhichKeyValue", { fg = "#ebbcba" })
  vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#908caa" })
  vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "WhichKeyGroup", { link = "String" })
  -- }}}
  -- Snacks {{{
  vim.api.nvim_set_hl(0, "SnacksBackdrop", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "NvimLightYellow" })
  vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "NvimLightGrey2" })
  vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "NvimLightRed" })
  -- }}}
  -- Bufferline {{{
  vim.api.nvim_set_hl(0, "BufferlineSeparatorVisible", { fg = "NvimLightGrey1" })
  vim.api.nvim_set_hl(0, "BufferlineSeparatorSelected", { fg = "NvimLightGrey2" })
  -- }}}
  -- Flash
  vim.api.nvim_set_hl(0, "FlashLabel", { fg = "Red" })
end

-- }}}

return H
