local H = {}

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
-- Neovim default colorscheme {{{
function H.default_colorscheme()
  -- SEMANTIC HIGHLIGHTS {{{
  -- Editor {{{
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#919caa" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6E8294" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "NvimDarkGrey4", bold = true })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#FF9E3B", bold = true })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "TelescopePromptTitle" })
  vim.api.nvim_set_hl(0, "@neorg.tags.ranged_verbatim.code_block", { link = "CursorLine" })
  -- }}}
  vim.api.nvim_set_hl(0, "@lsp.type.decorator", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@variable", { italic = false })
  vim.api.nvim_set_hl(0, "@markup.strong", { fg = "Cyan", bold = true, italic = false })
  vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })
  vim.api.nvim_set_hl(0, "htmlSpecialTagName", { link = "Special" })
  vim.api.nvim_set_hl(0, "Boolean", { link = "Statement" })
  vim.api.nvim_set_hl(0, "@attribute", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = "Red", bold = true })
  vim.api.nvim_set_hl(0, "@constant.builtin.python", { fg = "#eb6f92" })
  vim.api.nvim_set_hl(0, "@constant.python", { bold = true })
  vim.api.nvim_set_hl(0, "@constructor.python", { bold = true })
  -- Neogit {{{
  vim.api.nvim_set_hl(0, "NeogitChangeModified", { link = "Statement" })
  vim.api.nvim_set_hl(0, "NeogitChangeDeleted", { link = "Constant" })
  vim.api.nvim_set_hl(0, "NeogitChangeRenamed", { link = "Keyword" })
  -- }}}
  -- GitSigns {{{
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#8EC07C" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red" })
  -- }}}
  -- Lazy {{{
  vim.api.nvim_set_hl(0, "LazyH2", { fg = "Red" })
  vim.api.nvim_set_hl(0, "LazyCommit", { fg = "#7DC4E4", blend = 0 })
  vim.api.nvim_set_hl(0, "LazyCommitType", { fg = "#FF9E3B", blend = 0 })
  vim.api.nvim_set_hl(0, "LazyButtonActive", { link = "StHint" })
  vim.api.nvim_set_hl(0, "LazyReasonCmd", { link = "Number" })
  vim.api.nvim_set_hl(0, "LazyReasonKeys", { link = "PreProc" })
  vim.api.nvim_set_hl(0, "LazyReasonRequire", { link = "Keyword" })
  -- }}}
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "NvimLightGrey4" })
  -- Rust
  vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { link = "Operator" })
  -- Generic semantic tokens

  if vim.o.background == "light" then
    -- Light background {{{
    vim.api.nvim_set_hl(0, "Cursor", { fg = "NvimDarkRed", bg = "NvimLightBlue" })
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "NvimDarkRed" })
    vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "NvimDarkGrey2", bold = true, italic = false, underline = false })
    vim.api.nvim_set_hl(0, "@lsp.type.decorator", { fg = "NvimDarkYellow", bold = false, italic = true })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = "NvimDarkMagenta", bold = true, italic = false })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "NvimDarkGreen", bold = false, italic = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.interface.defaultLibrary.typescript", { fg = "NvimDarkGrey2", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.property.defaultLibrary.typescript", { fg = "NvimDarkGrey2", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.definition", { fg = "Magenta", bold = false })
    vim.api.nvim_set_hl(0, "Operator", { fg = "NvimDarkMagenta", bold = true })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "NvimDarkYellow", bold = true })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "NvimDarkGrey3", italic = true })
    vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "NvimDarkBlue", italic = true })
    vim.api.nvim_set_hl(0, "@pythonDecoratorName", { link = "@lsp.type.decorator" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "NvimDarkGrey4", italic = true, blend = 0 })
    vim.api.nvim_set_hl(0, "htmlTag", { fg = "NvimDarkMagenta" })
    vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTag" })
    vim.api.nvim_set_hl(0, "PreProc", { italic = true, fg = "#b4637a" })
    vim.api.nvim_set_hl(0, "Keyword", { fg = "NvimDarkBlue", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "@keyword.type.python", { fg = "NvimDarkBlue", italic = false })
    vim.api.nvim_set_hl(0, "Number", { fg = "#0550AE" })
    vim.api.nvim_set_hl(0, "String", { fg = "NvimDarkGreen", italic = false })
    vim.api.nvim_set_hl(0, "Constant", { fg = "NvimDarkYellow", bold = true, italic = false })
    vim.api.nvim_set_hl(0, "Statement", { fg = "#45475A", italic = true, bold = true })
    vim.api.nvim_set_hl(0, "Special", { fg = "#383A42", italic = true })
    vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = "#F5EBD9", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "Red" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "Red", undercurl = true })
  else
    -- Dark background {{{
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "NvimLightRed" })
    vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "NvimLightGrey2", bold = true, italic = false })
    vim.api.nvim_set_hl(0, "@lsp.type.decorator", { fg = "NvimLightYellow", bold = false, italic = true })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = "NvimLightMagenta", bold = false, italic = false })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "NvimLightGreen", bold = false, italic = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.interface.defaultLibrary.typescript", { fg = "NvimLightGrey2", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.property.defaultLibrary.typescript", { fg = "NvimLightGrey2", bold = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.parameter.definition", { fg = "NvimLightMagenta", bold = false })
    vim.api.nvim_set_hl(0, "@lsp.type.identifier.swift", { fg = "NvimLightGrey2", bold = true })
    vim.api.nvim_set_hl(0, "Operator", { fg = "NvimLightMagenta", bold = true })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "GoldenRod", bold = true })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "NvimLightGrey3", italic = true })
    vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "NvimLightBlue", italic = true })
    vim.api.nvim_set_hl(0, "Comment", { fg = "NvimLightGrey4", italic = true, blend = 0 })
    vim.api.nvim_set_hl(0, "htmlTag", { fg = "NvimLightMagenta" })
    vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTag" })
    vim.api.nvim_set_hl(0, "PreProc", { italic = true, fg = "#EB6F92" })
    vim.api.nvim_set_hl(0, "Keyword", { fg = "NvimLightBlue", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "@keyword.type.python", { fg = "NvimLightBlue", italic = false })
    vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
    vim.api.nvim_set_hl(0, "String", { fg = "NvimLightGreen", italic = false })
    vim.api.nvim_set_hl(0, "Constant", { fg = "NvimLightYellow", bold = true, italic = false })
    vim.api.nvim_set_hl(0, "Statement", { fg = "#B3F0FF", italic = true, bold = true })
    vim.api.nvim_set_hl(0, "Special", { fg = "#76E3EA", italic = true })
    vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = "NvimDarkGrey1", bold = true })
    -- }}}
  end
end

return H
