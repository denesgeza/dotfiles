Is_enabled = require("core.functions").is_enabled
Manager = require("core.manager")
return {
  "scottmckendry/cyberdream.nvim",
  enabled = Is_enabled('cyberdream'),
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Recommended - see "Configuring" below for more config options
      transparent = Manager.transparency,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = false,
      terminal_colors = true,
    })
  end,
}
