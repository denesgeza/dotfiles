local Is_enabled = require("core.functions").is_enabled

return {
  "kylechui/nvim-surround",
  enabled = Is_enabled("nvim-surround"),
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
