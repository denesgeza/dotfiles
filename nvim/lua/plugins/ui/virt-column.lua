Is_Enabled = require("config.functions").is_enabled

return {
  "lukas-reineke/virt-column.nvim",
  enabled = Is_Enabled("virt-column"),
  lazy = false,
  opts = {
    char = "│",
    -- char = "┊",
    highlight = "NonText",
    virtcolumn = "100",
  },
}
