local H = {}
local c = {}

function H.set_highlights()
  c.normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
  c.normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
  c.hint_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticHint"), "fg")
  c.info_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticInfo"), "fg")
  c.warn_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticWarn"), "fg")
  c.error_fg = vim.fn.synIDattr(vim.fn.hlID("ErrorMsg"), "fg")
  c.lazy_special_fg = vim.fn.synIDattr(vim.fn.hlID("Special"), "fg")
  c.statusline_bg = vim.fn.synIDattr(vim.fn.hlID("StatusLine"), "bg")
  c.comment_fg = vim.fn.synIDattr(vim.fn.hlID("Comment"), "fg")
  c.comment_bg = vim.fn.synIDattr(vim.fn.hlID("Comment"), "bg")
  c.cursoline_bg = vim.fn.synIDattr(vim.fn.hlID("CursorLine"), "bg")
  c.cursoline_fg = vim.fn.synIDattr(vim.fn.hlID("CursorLine"), "fg")
  c.boolean_fg = vim.fn.synIDattr(vim.fn.hlID("Boolean"), "fg")

  if vim.g.colors_name == "default" then
    require("settings.highlights.default").default_colorscheme(c)
  end

  -- Cmp highlights
  -- Transparent
  if Settings.transparency == true then
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    -- vim.api.nvim_set_hl(0, "SnacksNormal", { link = "Normal" })
    -- vim.api.nvim_set_hl(0, "SnacksNormalNC", { link = "Normal" })
    -- vim.api.nvim_set_hl(0, "SnacksBackdrop", { link = "Normal" })
    -- vim.api.nvim_set_hl(0, "SnacksWinBar", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "SnacksWinBarNC", { bg = "NONE" })
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
    end
  -- Opaque
  else
    -- vim.api.nvim_set_hl(0, "Normal", { fg = c.normal_fg, bg = c.normal_bg })
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.normal_fg, bg = c.cursoline_bg, reverse = true })
    vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = c.normal_fg, bg = "#908caa", reverse = true })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Comment", { fg = c.comment_fg, bg = c.normal_bg, italic = true })
  end
  vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Comment" })
  -- Word highlights
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "Visual" })
  vim.api.nvim_set_hl(0, "LspReferenceText", { link = "Visual" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "Visual" })
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
  -- NeoTree {{{
  vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = c.normal_bg, bg = c.normal_fg })
  -- }}}
  --  nvim-cmp {{{
  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

  -- Icons
  vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
  vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

  vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

  vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
  vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
  vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
  vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
  vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

  vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
  vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
  vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644", bg = "#b4637a" })
  -- }}}
  -- StatusLine {{{
  -- Fancy statusline
  vim.api.nvim_set_hl(0, "StItem", { bg = c.normal_fg, fg = c.normal_bg })
  vim.api.nvim_set_hl(0, "StItem2", { bg = "#45475a", fg = "#B8C0E0" })
  vim.api.nvim_set_hl(0, "StSep", { bg = "NONE", fg = c.normal_fg, blend = 100 })
  vim.api.nvim_set_hl(0, "StSep2", { bg = "NONE", fg = "#45475A" })
  vim.api.nvim_set_hl(0, "StErr", { bg = "Red", fg = "#383A42", bold = true })
  vim.api.nvim_set_hl(0, "StErrSep", { bg = "NONE", fg = "Red" })
  vim.api.nvim_set_hl(0, "StWarn", { bg = "#FF9E3B", fg = "#383A42", bold = true })
  vim.api.nvim_set_hl(0, "StWarnSep", { bg = "NONE", fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = "#383A42", bold = true })
  vim.api.nvim_set_hl(0, "StHintSep", { bg = "NONE", fg = "#8EC07C", bold = true })
  vim.api.nvim_set_hl(0, "StInfo", { bg = "#8BD5CA", fg = "#383A42", bold = true })
  vim.api.nvim_set_hl(0, "StInfoSep", { bg = "NONE", fg = "#8BD5CA", bold = true })
  vim.api.nvim_set_hl(0, "StAdded", { bg = "#45475A", fg = "#8EC07C" })
  vim.api.nvim_set_hl(0, "StChanged", { bg = "#45475A", fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "StRemoved", { bg = "#45475A", fg = "Red" })
  vim.api.nvim_set_hl(0, "StSpecial", { bg = "#45475A", fg = c.lazy_special_fg })
  vim.api.nvim_set_hl(0, "ErrText", { fg = "Red" })
  -- Simple statusline
  vim.api.nvim_set_hl(0, "SLDiagErr", { fg = "Red", bg = c.statusline_bg })
  vim.api.nvim_set_hl(0, "SLDiagHint", { fg = "#8EC07C", bg = c.statusline_bg })
  vim.api.nvim_set_hl(0, "SLDiagWarn", { fg = "#FF9E3B", bg = c.statusline_bg })
  vim.api.nvim_set_hl(0, "SLDiagInfo", { fg = c.info_fg, bg = c.statusline_bg })
end

-- }}}

return H
