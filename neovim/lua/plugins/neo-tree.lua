local Is_enabled = require("core.functions").is_enabled
return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = Is_enabled("neo-tree"),
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim",
  },
  opts = {
    window = {
      position = "left", ---@type "left" | "right" | "top" | "bottom" | "float" | "current"
      mappings = {
        ["e"] = "noop",
      },
    },
    -- source_selector = {
    --   statusline = false,
    --   winbar = true,
    --   content_layout = "center",
    -- },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "NeoTree",
    },
  },
}
