Is_Enabled = require("config.functions").is_enabled
Manager = require("config.manager")
LazyVim = require("lazyvim.util")

return {
  "ibhagwan/fzf-lua",
  enabled = Manager.explorer == "fzf",
  -- enabled = LazyVim.has_extra("editor.fzf"),
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end,
  keys = {
    { "<leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Branches" },
    { "<leader>si", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
    { "<leader>sp", LazyVim.pick.config_files(), desc = "Find Config File" },
    { "<C-n>", "<Down>", ft = "fzf", mode = "t", nowait = true },
    { "<C-e>", "<Up>", ft = "fzf", mode = "t", nowait = true },
  },
}
