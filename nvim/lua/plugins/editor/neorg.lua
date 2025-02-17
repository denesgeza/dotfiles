Is_Enabled = require("config.functions").is_enabled

return {
  "nvim-neorg/neorg",
  enabled = Is_Enabled("neorg"),
  lazy = true,
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      -- ["core.completion"] = {
      --   config = {
      --     engine = "nvim-cmp", -- We recommend setting the completion engine
      --   },
      -- },
      ["core.concealer"] = {
        config = {
          icon_preset = "basic", ---@type "basic"|"diamond"|"varied"
          folds = true, ---@type boolean
        },
      }, -- Adds pretty icons to your documents
      ["core.qol.todo_items"] = {
        config = {
          create_todo_items = true,
          create_todo_parents = true,
        },
      },
      ["core.ui"] = {},
      ["core.ui.calendar"] = {}, -- Adds a calendar sidebar
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {},
          default_workspace = "notes",
        },
      },
    },
  },
  config = function(_, opts)
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
      opts.load["core.dirman"].config.workspaces.notes = "C:\\Users\\denes\\OneDrive - Gonvarri\\Documents\\Neorg\\"
    elseif vim.fn.has("unix") == 1 then
      opts.load["core.dirman"].config.workspaces.notes = "/Users/geza/OneDrive - Gonvarri/Documents/Neorg/"
    else
      opts.load["core.dirman"].config.workspaces.notes = "/mnt/c/Users/denes/OneDrive - Gonvarri/Documents/Neorg/"
    end
    require("neorg").setup(opts)
  end,
  keys = {
    { mode = { "n" }, "<leader>ni", "<cmd>Neorg index<cr>", desc = "Index" },
    { mode = { "n" }, "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Journal" },
    { mode = { "n" }, "<leader>nt", "<cmd>Neorg toggle-concealer<cr>", desc = "Concealer" },
    { mode = { "n" }, "<leader>nr", "<cmd>Neorg<cr>", desc = "Neorg" },
    { mode = { "n" }, "<leader>nr", "<cmd>Neorg module<cr>", desc = "Module" },
    { mode = { "n" }, "<leader>nw", "<cmd>Neorg workspace<cr>", desc = "Workspace" },
    { mode = { "n" }, "<leader>nx", "<cmd>Neorg return<cr>", desc = "Return" },
  },
}
