local H = {}
local c = {}

-- Default colors {{{
-- Colors which define Nvim's default color scheme:
--                Background
--         Dark        |    Light
-----------------------|---------------------
--     NvimDarkBlue    |    NvimLightBlue
--     NvimDarkCyan    |    NvimLightCyan
--     NvimDarkGreen   |    NvimLightGreen
--     NvimDarkGrey1   |    NvimLightGrey1
--     NvimDarkGrey2   |    NvimLightGrey2
--     NvimDarkGrey3   |    NvimLightGrey3
--     NvimDarkGrey4   |    NvimLightGrey4
--     NvimDarkMagenta |    NvimLightMagenta
--     NvimDarkRed     |    NvimLightRed
--     NvimDarkYellow  |    NvimLightYellow
--------------------------------------------- }}}

function H.set_highlights()
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
  -- Neovim default colorscheme {{{
  if vim.g.colors_name == "default" then
    -- CMP Documentation highlights
    vim.api.nvim_set_hl(0, "@markup.strong", { fg = "Cyan", bold = true, italic = false })
    -- Get some existing colors
    c.normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
    c.normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
    c.hint_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticHint"), "fg")
    c.info_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticInfo"), "fg")
    c.warn_fg = vim.fn.synIDattr(vim.fn.hlID("DiagnosticWarn"), "fg")
    c.error_fg = vim.fn.synIDattr(vim.fn.hlID("ErrorMsg"), "fg")
    c.lazy_special_fg = vim.fn.synIDattr(vim.fn.hlID("Special"), "fg")
    c.statusline_bg = vim.fn.synIDattr(vim.fn.hlID("StatusLine"), "bg")

    vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })
    vim.api.nvim_set_hl(0, "htmlSpecialTagName", { link = "Special" })
    vim.api.nvim_set_hl(0, "Boolean", { link = "Statement" })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { link = "@parameter" })
    vim.api.nvim_set_hl(0, "Type", { bold = true })
    vim.api.nvim_set_hl(0, "@attribute", { link = "Constant" })
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = "Red", bold = true })
    vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })
    -- Python
    vim.api.nvim_set_hl(0, "@variable.buitin.python", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment" })
    vim.api.nvim_set_hl(0, "@constant.builtin.python", { fg = "#eb6f92" })
    vim.api.nvim_set_hl(0, "@constant.python", { bold = true })
    vim.api.nvim_set_hl(0, "@constructor.python", { bold = true })
    -- GitSigns {{{
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#8EC07C" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FF9E3B" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red" })
    -- }}}
    -- Flash
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "Red" })
    -- NeoTree {{{
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = c.normal_bg, bg = c.normal_fg })
    -- }}}
    -- Lazy {{{
    vim.api.nvim_set_hl(0, "LazyH2", { fg = "Red" })
    vim.api.nvim_set_hl(0, "LazyCommit", { fg = "#7DC4E4" })
    vim.api.nvim_set_hl(0, "LazyCommitType", { fg = "#FF9E3B" })
    vim.api.nvim_set_hl(0, "LazyButtonActive", { link = "StHint" })
    vim.api.nvim_set_hl(0, "LazyReasonCmd", { link = "Number" })
    vim.api.nvim_set_hl(0, "LazyReasonKeys", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "LazyReasonRequire", { link = "Keyword" })
    -- }}}
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#919caa" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6E8294" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "NvimDarkGrey4", bold = true })
    -- Theme specific
    -- Ideas
    -- https://rosepinetheme.com/palette/ingredients/
    -- Light background {{{
    if vim.o.background == "light" then
      vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "NvimDarkGreen", italic = true })
      vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "NvimDarkMagenta", italic = true })
      vim.api.nvim_set_hl(0, "Comment", { fg = "NvimDarkGrey4", italic = true })
      vim.api.nvim_set_hl(0, "htmlTag", { fg = "NvimDarkMagenta" })
      vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTag" })
      vim.api.nvim_set_hl(0, "PreProc", { italic = true, fg = "#b4637a" })
      vim.api.nvim_set_hl(0, "@variable", { fg = "NvimDarkGrey2", italic = true })
      vim.api.nvim_set_hl(0, "Keyword", { fg = "NvimDarkBlue", bold = true })
      vim.api.nvim_set_hl(0, "Number", { fg = "#0550AE" })
      vim.api.nvim_set_hl(0, "String", { fg = "NvimDarkGreen", italic = true })
      vim.api.nvim_set_hl(0, "Constant", { fg = "#EA9D34", bold = true })
      vim.api.nvim_set_hl(0, "Statement", { fg = "#45475A", italic = true, bold = true })
      vim.api.nvim_set_hl(0, "Special", { fg = "#383A42", italic = true })
      vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = "#F5EBD9", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "Red" })
      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "Red" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "Red", undercurl = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#000000", bg = "#D6CFD3", bold = true }) -- }}}
    -- Dark background {{{
    else
      vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "NvimLightGreen", italic = true })
      vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#EB6F92", italic = true })
      vim.api.nvim_set_hl(0, "Comment", { fg = "NvimLightGrey4", italic = true })
      vim.api.nvim_set_hl(0, "htmlTag", { fg = "NvimLightMagenta" })
      vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTag" })
      vim.api.nvim_set_hl(0, "PreProc", { italic = true, fg = "#EB6F92" })
      vim.api.nvim_set_hl(0, "@variable", { fg = "NvimLightGrey2", italic = true })
      vim.api.nvim_set_hl(0, "Keyword", { fg = "NvimLightBlue", bold = true })
      vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
      vim.api.nvim_set_hl(0, "String", { fg = "NvimLightGreen", italic = true })
      vim.api.nvim_set_hl(0, "Constant", { fg = "#F6C177", italic = true })
      vim.api.nvim_set_hl(0, "Statement", { fg = "#B3F0FF", italic = true, bold = true })
      vim.api.nvim_set_hl(0, "Special", { fg = "#76E3EA", italic = true })
      vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = c.normal_bg, bold = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#ffffff", bg = "#4E4A3D", bold = true })
      if Customize.transparency == true then
        vim.api.nvim_set_hl(0, "Normal", { fg = "NvimLightGrey2" })
        vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      end
      -- }}}
    end
    -- statusline {{{
    if not Is_Enabled("lualine") then
      if Customize.statusline == "fancy" then
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      elseif Customize.statusline == "simple" then
        -- leave the default highlight
      end
    end
  end

  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "IlluminatedWordRead" })
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "IlluminatedWordRead" })
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
end

return H
