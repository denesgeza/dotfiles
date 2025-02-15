return {
  "bassamsdata/namu.nvim",
  enabled = Is_Enabled("namu"),
  lazy = false,
  config = function()
    require("namu").setup({
      -- Enable the modules you want
      namu_symbols = {
        enable = true,
        options = {
          display = {
            mode = "icon", ---@type "icon" | "text" | "raw"
            padding = 2,
          },
        }, -- here you can configure namu
      },
      -- Optional: Enable other modules if needed
      colorscheme = {
        enable = false,
        options = {
          persist = true, -- very efficient mechanism to Remember selected colorscheme
          write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
        },
      },
      ui_select = { enable = false }, -- vim.ui.select() wrapper
    })
    -- === Suggested Keymaps: ===
    local namu = require("namu.namu_symbols")
    local colorscheme = require("namu.colorscheme")
    vim.keymap.set("n", "<leader>cp", namu.show, {
      desc = "Jump to LSP symbol",
      silent = false,
    })
    vim.keymap.set("n", "<leader>ue", colorscheme.show, {
      desc = "Colorscheme Picker",
      silent = false,
    })
  end,
}
