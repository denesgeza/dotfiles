Is_enabled = require("core.functions").is_enabled

return {
  "danielfalk/smart-open.nvim",
  enabled = Is_enabled('smart-open'),
  branch = "0.2.x",
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  keys = {
    { "<leader>se", "<cmd>Telescope smart_open<cr>", desc = "Smart open" },
  },
}
