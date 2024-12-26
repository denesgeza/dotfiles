Is_Enabled = require("config.functions").is_enabled
local icons = require("settings.icons")

return {
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = Is_Enabled("dadbod"),
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
      vim.g.db_ui_icons = icons.db_ui_icons
    end,
    keys = {
      { mode = { "n" }, "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "DB Toggle UI" },
      { mode = { "n" }, "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DB Find buffer" },
      { mode = { "n" }, "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB Rename buffer" },
      { mode = { "n" }, "<leader>Dl", "<cmd>DBUILastQueryInfo<cr>", desc = "DB Last Query Info" },
    },
  },
  { -- optional saghen/blink.cmp completion source
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add vim-dadbod-completion to your completion providers
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer", "dadbod" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
  },
}
