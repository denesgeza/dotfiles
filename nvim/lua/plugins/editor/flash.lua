Is_Enabled = require("config.functions").is_enabled

return {
  "folke/flash.nvim",
  enabled = Is_Enabled("flash"),
  keys = {
    { "S", mode = { "n", "x", "o" }, false },
    { "s", mode = { "x" }, false },
  },
}
