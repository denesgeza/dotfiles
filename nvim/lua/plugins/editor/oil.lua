Is_Enabled = require("config.functions").is_enabled

return {
  "stevearc/oil.nvim",
  enabled = Is_Enabled("oil"),
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
