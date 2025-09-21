Is_Enabled = require("config.functions").is_enabled

return {
  "stevearc/overseer.nvim",
  enabled = Is_Enabled("compiler"),
  -- commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
  cmd = { "CompilerOpen", "CompilerToggleResults" },
  opts = {
    -- Tasks are disposed 5 minutes after running to free resources.
    -- If you need to close a task inmediatelly:
    -- press ENTER in the menu you see after compiling on the task you want to close.
    strategy = "toggleterm",
    dap = false,
    task_list = {
      direction = "bottom",
      min_height = 25,
      max_height = 25,
      default_detail = 1,
      bindings = {
        ["q"] = function() vim.cmd("OverseerClose") end,
      },
    },
  },
}
