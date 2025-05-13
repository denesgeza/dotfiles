return {
  "j-hui/fidget.nvim",
  enabled = not Is_Enabled("noice") and Settings.notifications == "fidget",
  lazy = true,
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
  keys = {
    { mode = { "n" }, "<leader>un", "<cmd>Fidget history<cr>", desc = "Notifications" },
  },
}
