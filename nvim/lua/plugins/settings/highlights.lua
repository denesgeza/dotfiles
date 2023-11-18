local H = {}
local c = {}

function H.set_highlights()
  --  nvim-cmp {{{
  -- These are set in the colorschemes
  -- pcall(vim.api.nvim_set_hl, 0, "PMenuSel", { bg = "#aaafff", fg = "#000000", italic = true, bold = true })
  -- pcall(vim.api.nvim_set_hl, 0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

  pcall(vim.api.nvim_set_hl, 0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

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
  -- }}}
  -- statusline {{{
  c.normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
  c.normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
  c.error_fg = vim.fn.synIDattr(vim.fn.hlID("ErrorMsg"), "fg")
  c.lazy_special_fg = vim.fn.synIDattr(vim.fn.hlID("Special"), "fg")
  pcall(vim.api.nvim_set_hl, 0, "Statusline", { bg = "NONE" })
  pcall(vim.api.nvim_set_hl, 0, "StItem", { bg = c.normal_fg, fg = c.normal_bg })
  pcall(vim.api.nvim_set_hl, 0, "StItem2", { bg = "#45475a", fg = "#B8C0E0" })
  pcall(vim.api.nvim_set_hl, 0, "StSep", { bg = "NONE", fg = c.normal_fg, blend = 100 })
  pcall(vim.api.nvim_set_hl, 0, "StSep2", { bg = "NONE", fg = "#45475A" })
  pcall(vim.api.nvim_set_hl, 0, "StErr", { bg = c.error_fg, fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StErrSep", { bg = "NONE", fg = c.error_fg })
  pcall(vim.api.nvim_set_hl, 0, "StWarn", { bg = "#FAB387", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StWarnSep", { bg = "NONE", fg = "#FAB387" })
  pcall(vim.api.nvim_set_hl, 0, "StHint", { bg = "#a6da95", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StHintSep", { bg = "NONE", fg = "#A6DA95", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StInfo", { bg = "#8bd5ca", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StInfoSep", { bg = "NONE", fg = "#8BD5CA", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StAdded", { bg = "#45475A", fg = "#8EC07C" })
  pcall(vim.api.nvim_set_hl, 0, "StChanged", { bg = "#45475A", fg = "#FAB387" })
  pcall(vim.api.nvim_set_hl, 0, "StRemoved", { bg = "#45475A", fg = c.error_fg })
  pcall(vim.api.nvim_set_hl, 0, "StSpecial", { bg = "#45475A", fg = c.lazy_special_fg })
  -- }}}
  -- folding
  -- local cl = vim.api.nvim_get_hl(0, { name = "CursorLineNr" })
  -- vim.api.nvim_set_hl(0, "FoldedIcon", { fg = cl.bg })
  -- vim.api.nvim_set_hl(0, "FoldedText", { bg = cl.bg, fg = cl.fg, italic = true })

  -- custom cmp
  vim.api.nvim_set_hl(0, "PMenuSel", { bg = "#aaafff", fg = "#000000", bold = true, italic = true })
end

return H
