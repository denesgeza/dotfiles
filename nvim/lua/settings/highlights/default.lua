local H = {}
-- Highlight groups for default colorscheme
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
-- Update existing highlights {{{
H.diag_warn_fg = Functions.get_color("DiagnosticWarn", "fg")
H.diag_err_fg = Functions.get_color("DiagnosticError", "fg")
H.diag_hint_fg = Functions.get_color("DiagnosticHint", "fg")
H.diag_info_fg = Functions.get_color("DiagnosticInfo", "fg")
-- }}}
-- Neovim default colorscheme {{{
function H.default_colorscheme()
  local highlights = {
    -- Editor
    LineNrAbove = { fg = "#919caa" },
    LineNrBelow = { fg = "#6E8294" },
    LineNr = { fg = "NvimDarkGrey4", bold = true },
    TelescopePromptTitle = { fg = "#FF9E3B", bold = true },
    TelescopePromptBorder = { link = "TelescopePromptTitle" },
    ["@neorg.tags.ranged_verbatim.code_block"] = { link = "CursorLine" },
    Conceal = { link = "Comment" },
    ["@variable"] = { italic = false },
    ["@markup.strong"] = { fg = "Cyan", bold = true, italic = false },
    ["@tag.html"] = { link = "htmlTag" },
    WinSeparator = { link = "NonText" },
    htmlSpecialTagName = { link = "Special" },
    htmlArg = { link = "htmlTag" },
    Boolean = { link = "Statement" },
    ["@attribute"] = { link = "Constant" },
    ["@keyword.return"] = {
      light = { fg = "NvimDarkRed", bold = true },
      dark = { fg = "NvimLightRed", bold = true },
    },
    ["@constant.builtin.python"] = { fg = "#eb6f92" },
    ["@constant.python"] = { link = "Constant", bold = true },
    ["@constructor.python"] = { bold = true },
    ["@string.documentation.python"] = { link = "String", italic = true },

    -- GitSigns
    GitSignsAdd = { fg = "#8EC07C" },
    GitSignsChange = { fg = "#FF9E3B" },
    GitSignsDelete = { fg = "Red" },
    -- Lazy
    LazyH2 = { fg = "Red" },
    LazyCommit = { fg = "#7DC4E4", blend = 0 },
    LazyCommitType = { fg = "#FF9E3B", blend = 0 },
    LazyButtonActive = { link = "StHint" },
    LazyReasonCmd = { link = "Number" },
    LazyReasonKeys = { link = "PreProc" },
    LazyReasonRequire = { link = "Keyword" },
    -- Flash
    FlashLabel = { fg = "Red" },
    -- Snacks
    SnacksIndent1 = { fg = "#E06C75" },
    SnacksIndent2 = { fg = "#E5C07B" },
    SnacksIndent3 = { fg = "#98C379" },
    SnacksPickerDir = { link = "Comment" },
    SnacksBackdrop = { bg = "NONE" },
    SnacksDashboardIcon = { link = "Constant" },
    SnacksDashboardDesc = { fg = "NvimLightGrey2" },
    SnacksDashboardKey = { fg = "NvimLightRed" },
    SnacksDashboardFile = { link = "GitSignsChange" },
    -- Diagnostic
    -- DiagnosticHint = { fg = "NvimLightGrey4", italic = true },
    DiagnosticWarn = { fg = H.diag_warn_fg, italic = true },
    DiagnosticHint = { fg = H.diag_hint_fg, italic = true },
    DiagnosticError = { fg = H.diag_err_fg, italic = true },
    DiagnosticInfo = { fg = H.diag_info_fg, italic = true },
    DiagnosticUnderlineError = { fg = "Red", undercurl = true },
    -- Rust
    ["@lsp.type.formatSpecifier.rust"] = { link = "Operator" },

    -- Normal = {
    --   light = { bg = "NvimDarkGrey2", fg = "NvimLightGrey2" },
    --   dark = { bg = "NvimDarkGrey1", fg = "NvimLightGrey2" },
    -- },
    CssCustomProp = { link = "String" },
    Cursor = {
      light = { fg = "NvimDarkRed", bg = "NvimLightBlue" },
      dark = { fg = "NvimLightRed", bg = "NvimDarkBlue" },
    },
    ["@lsp.type.namespace"] = {
      light = { fg = "NvimDarkRed" },
      dark = { fg = "NvimLightRed" },
    },
    ["@lsp.type.class"] = {
      light = { fg = "NvimDarkGrey2", bold = true, italic = false },
      dark = { fg = "NvimLightGrey2", bold = true, italic = false },
    },
    ["@lsp.type.decorator"] = {
      light = { fg = "NvimDarkYellow", bold = false, italic = true },
      dark = { fg = "NvimLightYellow", bold = false, italic = true },
    },
    ["@lsp.type.property"] = {
      light = { fg = "NvimDarkMagenta", bold = true, italic = false },
      dark = { fg = "NvimLightMagenta", bold = false, italic = false },
    },
    ["@lsp.type.parameter"] = {
      light = { fg = "NvimDarkGreen", bold = false, italic = true },
      dark = { fg = "#B3B4BB", bold = false, italic = true },
    },
    ["@lsp.typemod.interface.defaultLibrary.typescript"] = {
      light = { fg = "NvimDarkGrey2", bold = true },
      dark = { fg = "NvimLightGrey2", bold = true },
    },
    ["@lsp.typemod.property.defaultLibrary.typescript"] = {
      light = { fg = "NvimDarkGrey2", bold = true },
      dark = { fg = "NvimLightGrey2", bold = true },
    },
    ["@lsp.typemod.parameter.definition"] = {
      light = { fg = "NvimDarkMagenta", bold = false, italic = true },
      dark = { fg = "NvimLightMagenta", bold = false },
    },
    ["@lsp.typemod.parameter.definition.python"] = {
      light = { fg = "NvimDarkMagenta", bold = false, italic = true },
      dark = { fg = "NvimLightMagenta", bold = false },
    },
    Operator = {
      light = { fg = "NvimDarkMagenta", bold = true },
      dark = { fg = "NvimLightMagenta", bold = true },
    },
    ["@punctuation.bracket"] = {
      light = { fg = "NvimDarkYellow", bold = true },
      dark = { fg = "GoldenRod", bold = true },
    },
    ["@variable.builtin"] = {
      light = { fg = "NvimDarkGrey3", italic = true },
      dark = { fg = "NvimLightGrey3", italic = true },
    },
    ["@variable.parameter"] = {
      light = { fg = "NvimDarkBlue", italic = true },
      dark = { fg = "NvimLightBlue", italic = true },
    },
    htmlTag = {
      light = { fg = "NvimDarkMagenta", italic = true },
      dark = { fg = "NvimLightMagenta", italic = true },
    },
    PreProc = {
      light = { italic = true, fg = "#b4637a" },
      dark = { italic = true, fg = "#EB6F92" },
    },
    Keyword = {
      light = { fg = "NvimDarkBlue", bold = true, italic = true },
      dark = { fg = "NvimLightBlue", bold = true, italic = true },
    },
    ["@keyword.type.python"] = {
      light = { fg = "NvimDarkBlue", italic = false },
      dark = { fg = "NvimLightBlue", italic = false },
    },
    Number = {
      light = { fg = "#0550AE" },
      dark = { link = "Constant" },
    },
    String = {
      light = { fg = "NvimDarkGreen", italic = false },
      dark = { fg = "NvimLightGreen", italic = false },
    },
    Constant = {
      light = { fg = "NvimDarkYellow", bold = true, italic = false },
      dark = { fg = "NvimLightYellow", bold = true, italic = false },
    },
    Statement = {
      light = { fg = "#45475A", italic = true, bold = true },
      dark = { fg = "#B3F0FF", italic = true, bold = true },
    },
    Special = {
      light = { fg = "#383A42", italic = true },
      dark = { fg = "#76E3EA", italic = true },
    },
    StHint = {
      light = { bg = "#8EC07C", fg = "#F5EBD9", bold = true },
      dark = { bg = "#8EC07C", fg = "NvimDarkGrey1", bold = true },
    },
    djangoArgument = {
      light = { fg = "NvimDarkYellow", bold = false, italic = true },
      dark = { fg = "NvimLightYellow", bold = false, italic = true },
    },
    PmenuSel = {
      light = { bg = "#8EC07C", fg = "#F5EBD9" },
      dark = { bg = "#F5EBD9", fg = "NvimDarkGrey3" },
    },
  }

  local color = vim.o.background
  for hl, prop in pairs(highlights) do
    if prop[color] ~= nil and type(prop[color]) == "table" then
      vim.api.nvim_set_hl(0, hl, color == "light" and prop.light or prop.dark)
    else
      vim.api.nvim_set_hl(0, hl, prop)
    end
  end
end

return H
-- vim: foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
