Is_enabled = require("core.functions").is_enabled

return {
  "NeogitOrg/neogit",
  enabled = Is_enabled("neogit"),
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    {
      "sindrets/diffview.nvim", -- optional - Diff integration
      keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
        { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      },
    },

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua", -- optional
  },
  config = true,
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
  },
}
