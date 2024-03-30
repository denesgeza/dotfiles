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
  -- CMP Documentation highlights
  vim.api.nvim_set_hl(0, "@markup.strong", { fg = "Cyan", bold = true, italic = false })
  vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })
  vim.api.nvim_set_hl(0, "htmlSpecialTagName", { link = "Special" })
  vim.api.nvim_set_hl(0, "Boolean", { link = "Statement" })
  vim.api.nvim_set_hl(0, "@attribute", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@keyword.return", { fg = "Red", bold = true })
  -- Python
  -- vim.api.nvim_set_hl(0, "@string.documentation.python", { link = "Comment" })
  vim.api.nvim_set_hl(0, "@constant.builtin.python", { fg = "#eb6f92" })
  vim.api.nvim_set_hl(0, "@constant.python", { bold = true })
  vim.api.nvim_set_hl(0, "@constructor.python", { bold = true })
  -- GitSigns {{{
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#8EC07C" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red" })
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
  -- }}}
  -- Rust
  vim.api.nvim_set_hl(0, "@lsp.type.formatSpecifier.rust", { link = "Operator" })
  vim.api.nvim_set_hl(0, "@variable", { italic = true })

  if vim.o.background == "light" then
    -- Light background {{{
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "NvimDarkRed" })
    vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "NvimDarkYellow", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "@lsp.typemod.interface.defaultLibrary.typescript", { fg = "NvimDarkYellow", bold = true })
    vim.api.nvim_set_hl(0, "Operator", { fg = "NvimDarkMagenta", bold = true })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "NvimDarkMagenta", italic = true })
    vim.api.nvim_set_hl(0, "Comment", { fg = "NvimDarkGrey4", italic = true })
    vim.api.nvim_set_hl(0, "htmlTag", { fg = "NvimDarkMagenta" })
    vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTag" })
    vim.api.nvim_set_hl(0, "PreProc", { italic = true, fg = "#b4637a" })
    vim.api.nvim_set_hl(0, "Keyword", { fg = "NvimDarkBlue", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "Number", { fg = "#0550AE" })
    vim.api.nvim_set_hl(0, "String", { fg = "NvimDarkGreen", italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = "#EA9D34", bold = true })
    vim.api.nvim_set_hl(0, "Statement", { fg = "#45475A", italic = true, bold = true })
    vim.api.nvim_set_hl(0, "Special", { fg = "#383A42", italic = true })
    vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = "#F5EBD9", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "Red" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "Red", undercurl = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#000000", bg = "#D6CFD3", bold = true }) -- }}}
  else
    -- Dark background {{{
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "NvimLightRed" })
    vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "NvimLightYellow" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.interface.defaultLibrary.typescript", { fg = "NvimLightYellow", bold = true })
    vim.api.nvim_set_hl(0, "Operator", { fg = "NvimLightMagenta", bold = true })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "NvimLightMagenta", italic = true })
    vim.api.nvim_set_hl(0, "Comment", { fg = "NvimLightGrey4", italic = true })
    vim.api.nvim_set_hl(0, "htmlTag", { fg = "NvimLightMagenta" })
    vim.api.nvim_set_hl(0, "@tag.html", { link = "htmlTag" })
    vim.api.nvim_set_hl(0, "PreProc", { italic = true, fg = "#EB6F92" })
    vim.api.nvim_set_hl(0, "Keyword", { fg = "NvimLightBlue", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
    vim.api.nvim_set_hl(0, "String", { fg = "NvimLightGreen", italic = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = "#F6C177", italic = true })
    vim.api.nvim_set_hl(0, "Statement", { fg = "#B3F0FF", italic = true, bold = true })
    vim.api.nvim_set_hl(0, "Special", { fg = "#76E3EA", italic = true })
    vim.api.nvim_set_hl(0, "StHint", { bg = "#8EC07C", fg = "NvimDarkGrey1", bold = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#ffffff", bg = "#4E4A3D", bold = true })

    if Customize.transparency == true then
      vim.api.nvim_set_hl(0, "Normal", { fg = "NvimLightGrey2" })
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    end
    -- }}}
  end
end

return H
