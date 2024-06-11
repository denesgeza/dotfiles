Is_Enabled = require("config.functions").is_enabled

return {
  "benlubas/molten-nvim",
  enabled = Is_Enabled("molten"),
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  lazy = false,
  -- dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    -- these are examples, not defaults. Please see the readme
    -- vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = false
  end,
}
