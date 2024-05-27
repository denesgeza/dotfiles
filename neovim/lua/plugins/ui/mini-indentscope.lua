local Is_enabled = require("core.functions").is_enabled

return {
  {
    "echasnovski/mini.indentscope",
    enabled = Is_enabled("mini-indentscope"),
    version = false,
    opts = {
      symbol = "│",
      -- symbol = "┊",
      draw = {
        delay = 100,
      },
      options = {
        try_as_border = true,
        indent_at_cursor = true,
        border = "top", ---@type "top" | "bottom" | "both" | "none"
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
