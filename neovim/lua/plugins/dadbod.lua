Is_enabled = require("core.functions").is_enabled
return {
  "kristijanhusak/vim-dadbod-ui",
  enabled = Is_enabled("dadbod"),
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_show_help = 1
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g["db_ui_save_location"] = "~/.config/nvim/temp/db"
  end,
  keys = {
    { mode = { "n" }, "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "DB Toggle UI" },
    { mode = { "n" }, "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DB Find buffer" },
    { mode = { "n" }, "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB Rename buffer" },
    { mode = { "n" }, "<leader>Dl", "<cmd>DBUILastQueryInfo<cr>", desc = "DB Last Query Info" },
  },
}
