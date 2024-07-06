Is_Enabled = require("config.functions").is_enabled
-- lazy.nvim
return {
  "m4xshen/hardtime.nvim",
  enabled = Is_Enabled("hardtime"),
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  lazy = false,
  opts = {
    restricted_keys = {
      ["n"] = { "n" },
      ["e"] = { "n" },
      ["i"] = { "n" },
      ["l"] = {},
    },
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
    resetting_keys = {
      ["l"] = { "n" },
    },
  },
}
