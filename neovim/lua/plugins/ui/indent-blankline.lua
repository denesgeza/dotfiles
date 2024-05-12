local Is_enabled = require("core.functions").is_enabled

return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = Is_enabled("ibl"),
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      char = "┊",
      tab_char = "┊",
    },
    scope = { enabled = false },
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
      },
    },
  },
}
