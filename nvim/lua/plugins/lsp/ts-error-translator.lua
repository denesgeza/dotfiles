Is_Enabled = require("config.functions").is_enabled

return {
  "dmmulroy/ts-error-translator.nvim",
  enabled = Is_Enabled("ts-error-translator"),
  config = function() require("ts-error-translator").setup() end,
  lazy = false,
}
