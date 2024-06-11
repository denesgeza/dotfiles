Is_Enabled = require("config.functions").is_enabled

return {
  "Zeioth/compiler.nvim",
  enabled = Is_Enabled("compiler"),
  cmd = { "CompilerOpen", "CompilerToggleResults" },
  dependencies = { "stevearc/overseer.nvim" },
  keys = {
    {
      mode = { "n" },
      "<leader>cb",
      "<cmd>CompilerOpen<cr>",
      desc = "Compiler | Open",
    },
    {
      mode = { "n" },
      "<leader>ct",
      "<cmd>CompilerToggleResults<cr>",
      desc = "Compiler | Results",
    },
  },
  config = function(_, opts) require("compiler").setup(opts) end,
}
