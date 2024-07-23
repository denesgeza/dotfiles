Is_enabled = require("config.functions").is_enabled
return {
  "sindrets/diffview.nvim", -- optional - Diff integration
  enabled = Is_enabled("diffview"),
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
