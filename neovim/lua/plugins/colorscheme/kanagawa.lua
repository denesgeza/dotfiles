Manager = require('core.manager')
Is_enabled = require("core.functions").is_enabled
return {
  "rebelot/kanagawa.nvim",
  enabled = Is_enabled("kanagawa"),
  lazy = false,
  name = "kanagawa",
  priority = 1000,
  opts = {
    transparent = Manager.transparency,
    functionStyle = { italic = true },
    typeStyle = { italic = true },
    dim_inactive = true,
    theme = "wave",
    background = {
      dark = "wave",
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
      if Manager.transparency then
        return {
          Pmenu = { fg = theme.ui.shade0, bg = "none", blend = 0 }, -- add `blend = vim.o.pumblend` to enable transparency
          NormalFloat = { link = "Normal" },
          FloatBorder = { bg = "none", blend = 0 },
          Comment = { fg = theme.ui.fg_dim, bg = "none", blend = 0 },
          ["LazyCommitType"] = { fg = "#FF9E3B", blend = 0 },
          ["LazyCommit"] = { fg = "#7DC4E4", blend = 0 },
          TelescopeBorder = { bg = "none" },
        }
      else
        return {
          TelescopeBorder = { bg = "none" },
          DjangoVarBlock = { fg = "#7FB4CA" },
          DjangoTagBlock = { fg = "#7FB4CA" },
          ["@keyword.operator"] = { fg = theme.syn.operator, italic = true },
          ["@string.documentation.python"] = { link = "Comment" },
          ["@tag.attribute"] = { italic = true },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          IlluminatedWordRead = { fg = theme.syn.statement, bold = true, underline = true },
          IlluminatedWordWrite = { fg = theme.syn.statement, bold = true, underline = true },
          IlluminatedWordText = { fg = theme.syn.statement, bold = true, underline = true },
          StatusLineNC = { bg = theme.ui.bg_p1, blend = 10 },
          StatusLine = { bg = "none" },
        }
      end
    end,
  },
}
