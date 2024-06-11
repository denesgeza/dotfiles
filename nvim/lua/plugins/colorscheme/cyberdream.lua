Is_Enabled = require("config.functions").is_enabled

return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  enabled = Is_Enabled("cyberdream"),
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Recommended - see "Configuring" below for more config options
      transparent = Manager.transparency,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      terminal_colors = true,
    })
  end,
}
