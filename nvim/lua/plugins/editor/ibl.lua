Is_Enabled = require("config.functions").is_enabled

return {
  "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  enabled = Is_Enabled("indent-blankline"),
  opts = {
    indent = {
      char = "┊",
      tab_char = "┊",
    },
    scope = {
      enabled = true,
      show_start = false,
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "dashboard",
      },
    },
  },
}
