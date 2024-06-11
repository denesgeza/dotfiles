Is_Enabled = require("config.functions").is_enabled

return {
  "2kabhishek/nerdy.nvim",
  enabled = Is_Enabled("nerdy"),
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      mode = { "n" },
      "<leader>uN",
      "<cmd>Nerdy<cr>",
      desc = "Nerdy",
    },
  },
  cmd = "Nerdy",
}
