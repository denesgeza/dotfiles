Is_enabled = require("core.functions").is_enabled

return {
  "folke/ts-comments.nvim",
  event = "VeryLazy",
  enabled = Is_enabled("ts-comments"),
  opts = {},
}
