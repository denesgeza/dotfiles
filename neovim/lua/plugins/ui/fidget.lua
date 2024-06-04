Manager = require("core.manager")
local Is_enabled = require("core.functions").is_enabled

return {
  "j-hui/fidget.nvim",
  enabled = Is_enabled("noice") == false,
  event = "VeryLazy",
  opts = {
    progress = {
      display = {
        done_icon = "󰄭 ",
        done_ttl = 5,
      },
    },
    notification = {
      filter = vim.log.levels.INFO,
      override_vim_notify = true,
      window = {
        normal_hl = "Normal",
        border = "none",
        winblend = 0,
      },
    },
    integration = {
      ["nvim-tree"] = { enable = true },
    },
  },
  init = function()
    vim.notify = require("fidget").notify
  end,
}
