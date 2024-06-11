Is_Enabled = require("config.functions").is_enabled

return {
  "projekt0n/github-nvim-theme",
  enabled = Is_Enabled("github"),
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local palettes = {}
    local specs = {
      all = {
        syntax = {
          keyword = "#d73a49",
          conditional = "magenta.bright",
          number = "orange",
          delimiter = "orange",
        },
        git = {
          changed = "#ffa261",
        },
      },
      github_dark = {
        syntax = {
          operator = "orange",
        },
      },
    }
    local groups = {
      all = {
        Pmenu = { bg = "#22252A", fg = "#C5CDD9" },
        PMenuSel = { bg = "#aaafff", fg = "#000000", italic = true, bold = true },
        djangoVarBlock = { fg = "#7FB4CA" },
        djangoTagBlock = { fg = "#7FB4CA", italic = true },
        Type = { fg = "#E6C384", italic = true },
        ["@keyword.operator"] = { fg = "#E82424", italic = true },
        ["@string.documentation.python"] = { link = "Comment" },
        ["@tag.attribute"] = { italic = true },
        StatusLineNC = { bg = "NONE" },
        Delimiter = { fg = "#ffa261" },
      },
      github_light = {
        Pmenu = { bg = "#ffffff", fg = "#000000" },
        PMenuSel = { bg = "#e5e5e5", fg = "#000000", italic = true, bold = true },
        DjangoVarBlock = { fg = "#7FB4CA" },
        DjangoTagBlock = { fg = "#7FB4CA", italic = true },
        DjangoStatement = { fg = "#7FB4CA", italic = true },
        ["@tag.attribute"] = { italic = true },
      },
      github_light_default = {
        Pmenu = { bg = "#ffffff", fg = "#000000" },
        PMenuSel = { bg = "#e5e5e5", fg = "#000000", italic = true, bold = true },
        DjangoVarBlock = { fg = "#7FB4CA" },
        DjangoTagBlock = { fg = "#7FB4CA", italic = true },
        DjangoStatement = { fg = "#7FB4CA", italic = true },
        ["@tag.attribute"] = { italic = true },
      },
    }
    require("github-theme").setup({
      options = {
        transparent = Manager.transparency,
        dim_inactive = true,
        styles = {
          comments = "italic",
          keywords = "italic,bold",
          functions = "italic",
          variables = "",
          conditionals = "NONE",
          constants = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
        },
        inverse = {
          visual = false,
          match_paren = false,
          search = true,
        },
        darken = {
          floats = true,
          sidebars = { enabled = true },
        },
      },
      palettes = palettes,
      specs = specs,
      groups = groups,
    })
  end,
}
