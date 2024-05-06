local Manager = require("core.manager")
local Is_enabled = require("core.functions").is_enabled

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
  -- WhichKey {{{
  vim.api.nvim_set_hl(0, "WhichKey", { fg = "#b4637a" })
  vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "WhichKeyValue", { fg = "#ebbcba" })
  vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#908caa" })
  vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#8BD5CA" })
  -- }}}
  -- Dashboard {{{
  vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Function" })
  vim.api.nvim_set_hl(0, "DashboardFooter", { link = "Comment" })
  vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "NvimDarkRed" })
  vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#8EC07C" })
  vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "Dashboard", { fg = "NvimDarkCyan" })
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
  -- Illuminate {{{
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "IlluminatedWordRead" })
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "IlluminatedWordRead" })
  -- }}}
  --  nvim-cmp {{{
  pcall(vim.api.nvim_set_hl, 0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

  -- Icons
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemKindCopilot", { fg = "#6CC644", bg = "#b4637a" })
  -- }}}
  -- StatusLine {{{
  -- Fancy statusline
  pcall(vim.api.nvim_set_hl, 0, "StItem", { bg = c.normal_fg, fg = c.normal_bg })
  pcall(vim.api.nvim_set_hl, 0, "StItem2", { bg = "#45475a", fg = "#B8C0E0" })
  pcall(vim.api.nvim_set_hl, 0, "StSep", { bg = "NONE", fg = c.normal_fg, blend = 100 })
  pcall(vim.api.nvim_set_hl, 0, "StSep2", { bg = "NONE", fg = "#45475A" })
  pcall(vim.api.nvim_set_hl, 0, "StErr", { bg = "Red", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StErrSep", { bg = "NONE", fg = "Red" })
  pcall(vim.api.nvim_set_hl, 0, "StWarn", { bg = "#FF9E3B", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StWarnSep", { bg = "NONE", fg = "#FF9E3B" })
  pcall(vim.api.nvim_set_hl, 0, "StHint", { bg = "#8EC07C", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StHintSep", { bg = "NONE", fg = "#8EC07C", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StInfo", { bg = "#8BD5CA", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StInfoSep", { bg = "NONE", fg = "#8BD5CA", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StAdded", { bg = "#45475A", fg = "#8EC07C" })
  pcall(vim.api.nvim_set_hl, 0, "StChanged", { bg = "#45475A", fg = "#FF9E3B" })
  pcall(vim.api.nvim_set_hl, 0, "StRemoved", { bg = "#45475A", fg = "Red" })
  pcall(vim.api.nvim_set_hl, 0, "StSpecial", { bg = "#45475A", fg = c.lazy_special_fg })
  pcall(vim.api.nvim_set_hl, 0, "ErrText", { fg = "Red" })
  -- Simple statusline
  pcall(vim.api.nvim_set_hl, 0, "SLDiagErr", { fg = "Red", bg = c.statusline_bg })
  pcall(vim.api.nvim_set_hl, 0, "SLDiagHint", { fg = "#8EC07C", bg = c.statusline_bg })
  pcall(vim.api.nvim_set_hl, 0, "SLDiagWarn", { fg = "#FF9E3B", bg = c.statusline_bg })
  pcall(vim.api.nvim_set_hl, 0, "SLDiagInfo", { fg = c.info_fg, bg = c.statusline_bg })
  -- }}}
  -- statusline {{{
  if not Is_enabled("lualine") then
    if Manager.statusline == "fancy" then
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    elseif Manager.statusline == "simple" then
      -- leave the default highlight
    end
  end

  if vim.g.colors_name == "default" then
    require("colorscheme.default").default_colorscheme()
  end
end

return H
