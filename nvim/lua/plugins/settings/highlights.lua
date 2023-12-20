local H = {}
local c = {}

function H.set_highlights()
  --  nvim-cmp {{{
  -- vim.api.nvim_set_hl(0, "PMenuSel", { bg = "#aaafff", fg = "#000000", bold = true, italic = true })
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
  -- }}}
  -- statusline {{{
  c.normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
  c.normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
  c.hint_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticHint"), "fg")
  c.error_fg = vim.fn.synIDattr(vim.fn.hlID("ErrorMsg"), "fg")
  -- c.error_fg = vim.fn.synIDattr(vim.fn.hlID("NvimInternalError"), "bg")
  c.lazy_special_fg = vim.fn.synIDattr(vim.fn.hlID("Special"), "fg")
  pcall(vim.api.nvim_set_hl, 0, "StItem", { bg = c.normal_fg, fg = c.normal_bg })
  pcall(vim.api.nvim_set_hl, 0, "StItem2", { bg = "#45475a", fg = "#B8C0E0" })
  pcall(vim.api.nvim_set_hl, 0, "StSep", { bg = "NONE", fg = c.normal_fg, blend = 100 })
  pcall(vim.api.nvim_set_hl, 0, "StSep2", { bg = "NONE", fg = "#45475A" })
  pcall(vim.api.nvim_set_hl, 0, "StErr", { bg = "Red", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StErrSep", { bg = "NONE", fg = "Red" })
  pcall(vim.api.nvim_set_hl, 0, "StWarn", { bg = "#FF9E3B", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StWarnSep", { bg = "NONE", fg = "#FF9E3B" })
  pcall(vim.api.nvim_set_hl, 0, "StHint", { bg = c.hint_fg, fg = "#F5EBD9", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StHintSep", { bg = "NONE", fg = c.hint_fg, bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StInfo", { bg = "#8bd5ca", fg = "#383A42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StInfoSep", { bg = "NONE", fg = "#8BD5CA", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StAdded", { bg = "#45475A", fg = "#8EC07C" })
  pcall(vim.api.nvim_set_hl, 0, "StChanged", { bg = "#45475A", fg = "#FF9E3B" })
  pcall(vim.api.nvim_set_hl, 0, "StRemoved", { bg = "#45475A", fg = "Red" })
  pcall(vim.api.nvim_set_hl, 0, "StSpecial", { bg = "#45475A", fg = c.lazy_special_fg })
  -- }}}

  -- Neovim default colorscheme {{{
  if vim.g.colors_name == "default" then
    -- vim.api.nvim_set_hl(0, "@attribute", { fg = "#7dc4e4" })
    -- vim.api.nvim_set_hl(0, "@variable", { fg = "#58B5A8", italic = true })
    vim.api.nvim_set_hl(0, "djangoVarBlock", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "djangoStatement", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "htmlSpecialTagName", { link = "Special" })
    vim.api.nvim_set_hl(0, "htmlTagName", { fg = "#A377BF" })
    vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTagName" })
    vim.api.nvim_set_hl(0, "htmlTag", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@parameter", { italic = true, fg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#7E8294" })
    vim.api.nvim_set_hl(0, "Boolean", { link = "Statement" })
    vim.api.nvim_set_hl(0, "Type", { italic = true, bold = true })
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "Comment" })
    vim.api.nvim_set_hl(0, "Constant", { link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "@attribute", { fg = "#6A9589", italic = true, bold = true })
    -- vim.api.nvim_set_hl(0, "htmlArg", { italic = true, fg = "#7dc4e4" })
    vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment" })
    vim.api.nvim_set_hl(0, "@variable.builtin.python", { italic = true, fg = "#54aeff" })
    -- GitSigns
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#8EC07C" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FF9E3B" })
    -- Dashboard
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red" })
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#7dc4e4" })
    vim.api.nvim_set_hl(0, "Dashboard", { fg = "#7dc4e4" })
    if vim.o.background == "light" then
      vim.api.nvim_set_hl(0, "Statement", { fg = "#45475A", italic = true, bold = true })
      vim.api.nvim_set_hl(0, "Special", { fg = "#383A42", italic = true })
      vim.api.nvim_set_hl(0, "StHint", { bg = c.hint_fg, fg = "#F5EBD9", bold = true })
    else
      vim.api.nvim_set_hl(0, "Statement", { fg = "#b3f0ff", italic = true, bold = true })
      vim.api.nvim_set_hl(0, "Special", { fg = "#76e3ea", italic = true })
      vim.api.nvim_set_hl(0, "StHint", { bg = c.hint_fg, fg = c.normal_bg, bold = true })
    end
  end
  -- }}}
end

return H
