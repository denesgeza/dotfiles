local H = {}
-- Highlight groups for default colorscheme
-- Default colors {{{
-- Colors which define Nvim's default color scheme:
-- ----------------------------Background -----------------------------|
-- --------------------|------------|------------------|---------------|
--         Color       |    HEX     |    Color         |     HEX       |
-----------------------|------------|------------------|---------------|
--     NvimDarkBlue    |  #004c63   |  NvimLightBlue   |   #a6dbff     |
--     NvimDarkCyan    |  #007373   |  NvimLightCyan   |   #8cf8f7     |
--     NvimDarkGreen   |  #005523   |  NvimLightGreen  |   #b4f6c0     |
--     NvimDarkGrey1   |  #07080D   |  NvimLightGrey1  |   #eef1f8     |
--     NvimDarkGrey2   |  #14161B   |  NvimLightGrey2  |   #e0e2ea     |
--     NvimDarkGrey3   |  #2c2e33   |  NvimLightGrey3  |   #c4c6cd     |
--     NvimDarkGrey4   |  #4f5258   |  NvimLightGrey4  |   #9b9ea4     |
--     NvimDarkMagenta |  #470045   |  NvimLightMagenta|   #ffcaff     |
--     NvimDarkRed     |  #590008   |  NvimLightRed    |   #ffc0b9     |
--     NvimDarkYellow  |  #6b5300   |  NvimLightYellow |   #fce094     |
-----------------------------------------------------------------------}}}
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
    ["@neorg.tags.ranged_verbatim.code_block"] = { link = "CursorLine" },
    Conceal = { link = "Comment" },
    ["@markup.strong"] = { fg = "Cyan", bold = true, italic = false },
    ["@tag.html"] = { link = "htmlTag" },
    WinSeparator = { link = "NonText" },
    htmlSpecialTagName = { link = "Special" },
    htmlArg = { link = "htmlTag" },
    Boolean = { link = "Statement" },
    Operator = {
      light = { fg = "NvimDarkMagenta", italic = true },
      dark = { fg = "NvimLightMagenta", italic = true },
    },
    Keyword = { link = "Operator" },
    Type = {
      light = { fg = "NvimDarkYellow", bold = true },
      dark = { fg = "NvimLightYellow", bold = true },
    },

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
    SnacksDashboardDesc = { light = { fg = "NvimDarkGrey2" }, dark = { fg = "NvimLightGrey2" } },
    SnacksDashboardKey = { light = { fg = "NvimDarkRed" }, dark = { fg = "NvimLightRed" } },
    SnacksDashboardFile = { link = "GitSignsChange" },
    -- Diagnostic
    -- DiagnosticHint = { fg = "NvimLightGrey4", italic = true },
    DiagnosticSignWarn = { fg = H.diag_warn_fg },
    DiagnosticSignHint = { light = { fg = "#0550AE" }, dark = { fg = "NvimLightBlue" } },
    DiagnosticSignError = { fg = H.diag_err_fg },
    DiagnosticSignInfo = { fg = H.diag_info_fg },
    DiagnosticWarn = { fg = H.diag_warn_fg, italic = true },
    DiagnosticHint = { light = { fg = "#0550AE", italic = true }, dark = { fg = "NvimLightBlue", italic = true } },
    DiagnosticError = { fg = H.diag_err_fg, italic = true },
    DiagnosticInfo = { fg = H.diag_info_fg, italic = true },
    DiagnosticUnderlineError = { fg = "Red", undercurl = true },
    ErrorMsg = {
      light = { fg = "NvimDarkRed" },
      dark = { fg = "NvimLightRed" },
    },
    WarningMsg = {
      dark = { fg = "NvimLightYellow" },
      light = { fg = "NvimDarkYellow" },
    },
    -- Rust
    CssCustomProp = { link = "String" },
    Cursor = {
      light = { fg = "NvimDarkRed", bg = "NvimLightBlue" },
      dark = { fg = "NvimLightRed", bg = "NvimDarkBlue" },
    },
    ["@constructor"] = { link = "Type" },
    ["@module"] = { light = { fg = "NvimDarkGrey3" }, dark = { fg = "NvimLightGrey3" } },
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
    Number = { light = { fg = "#0550AE" }, dark = { link = "Constant" } },
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
-- vim: foldmethod=marker foldlevel=5 foldenable foldmarker={{{,}}}
