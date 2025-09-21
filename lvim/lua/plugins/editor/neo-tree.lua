Is_Enabled = require("config.functions").is_enabled

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = Is_Enabled("neo-tree"),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      "3rd/image.nvim",
      opts = {},
      cond = not vim.g.neovide,
    },
  },
  opts = {
    window = {
      mappings = {
        ["e"] = "noop",
      },
    },
  },
  keys = {
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "NeoTree",
    },
  },
}
