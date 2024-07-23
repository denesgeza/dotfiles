Is_Enabled = require("config.functions").is_enabled

return {
  "NeogitOrg/neogit",
  enabled = Is_Enabled("neogit"),
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required

    "sindrets/diffview.nvim",
    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua", -- optional
  },
  config = true,
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
  },
}
