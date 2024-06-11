Is_Enabled = require("config.functions").is_enabled

return {
  "lukas-reineke/headlines.nvim",
  enabled = Is_Enabled("headlines"),
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true, -- or `opts = {}`
}
