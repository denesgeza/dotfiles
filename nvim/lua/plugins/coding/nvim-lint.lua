Is_Enabled = require("config.functions").is_enabled

return {
  "mfussenegger/nvim-lint",
  enabled = Is_Enabled("nvim-lint"),
}
