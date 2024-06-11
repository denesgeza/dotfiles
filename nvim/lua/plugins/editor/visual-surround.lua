Is_Enabled = require("config.functions").is_enabled

return {
  "NStefan002/visual-surround.nvim",
  enabled = Is_Enabled("visual-surround"),
  lazy = false,
  config = function()
    require("visual-surround").setup({
      -- your config
    })
  end,
  -- or if you don't want to change defaults
  -- config = true
}
