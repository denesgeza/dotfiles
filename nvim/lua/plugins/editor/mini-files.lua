Is_Enabled = require("config.functions").is_enabled

return {
  "echasnovski/mini.files",
  enabled = Is_Enabled("mini.files"),
  version = false,
  lazy = false,
  opts = {
    mappings = {
      go_in = "i",
      go_in_plus = "I",
    },
  },
  keys = {
    { "<leader>fm", false },
    { "<leader>fM", false },
    {
      "<leader>f",
      function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end,
      desc = "Mini Files",
    },
  },
}
