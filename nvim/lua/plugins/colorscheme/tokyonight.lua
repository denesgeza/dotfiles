Is_Enabled = require("config.functions").is_enabled

return {
  "folke/tokyonight.nvim",
  enabled = Is_Enabled("tokyonight"),
  priority = 1000,
  lazy = false,
  opts = {
    style = "storm",
    light_style = "day",
    transparent = Manager.transparency,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = true, italic = true },
      variables = {},
      sidebars = "transparent",
      floats = "transparent",
    },
    day_brightness = 0.3,
    hide_inactive_statusline = true,
    dim_inactive = true,
    lualine_bold = true,
    on_colors = function(colors)
      colors.hint = colors.orange
      colors.error = "#ff0000"
    end,
    on_highlights = function(highlights, colors) end,
  },
}
