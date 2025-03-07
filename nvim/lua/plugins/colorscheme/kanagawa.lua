Is_Enabled = require("config.functions").is_enabled
return {
  "rebelot/kanagawa.nvim",
  enabled = Is_Enabled("kanagawa"),
  lazy = false,
  name = "kanagawa",
  priority = 1000,
  opts = {
    transparent = Settings.transparency,
    functionStyle = { italic = true },
    typeStyle = { italic = true },
    dim_inactive = true,
    theme = "dragon",
    background = {
      dark = "dragon",
      light = "lotus",
    },
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
            float = { bg = "none" },
          },
        },
        lotus = {
          ["@type.rust"] = { fg = "#a09cac" },
        },
      },
    },
    overrides = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "none" },
        -- Pmenu = { bg = "#22252A", fg = "#C5CDD9" },
        -- PMenuSel = { bg = "#aaafff", fg = "#000000", italic = true, bold = true },
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = 10 }, -- add `blend = vim.o.pumblend` to enable transparency
        -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        FloatShadow = { bg = "none" },
        FloatShadowThrough = { bg = "none" },
        TelescopeBorder = { bg = "none" },
        DjangoVarBlock = { fg = "#7FB4CA" },
        DjangoTagBlock = { fg = "#7FB4CA" },
        ["@keyword.operator"] = { fg = theme.syn.operator, italic = true },
        ["@string.documentation.python"] = { link = "Comment" },
        ["@tag.attribute"] = { italic = true },
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        StatusLineNC = { bg = theme.ui.bg_p1, blend = 10 },
        StatusLine = { bg = "none" },
        WinSeparator = { link = "Comment" },
        DiagnosticWarn = { italic = true },
        DiagnosticHint = { italic = true },
        DiagnosticError = { italic = true },
        DiagnosticInfo = { italic = true },
      }
    end,
  },
}
