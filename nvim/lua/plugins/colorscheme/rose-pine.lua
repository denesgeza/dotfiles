Is_Enabled = require("config.functions").is_enabled

return {
  "rose-pine/neovim",
  enabled = Is_Enabled("rose-pine"),
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "auto", ---@type "auto" | "moon" | "dawn" | "main"
    dark_variant = "moon", ---@type "moon" | "main"
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    styles = {
      bold = true,
      italic = true,
      transparency = Settings.transparency,
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
      ColorColumn = { bg = "rose" },

      -- Blend colours against the "base" background
      CursorLine = { bg = "foam", blend = 10 },

      -- By default each group adds to the existing config.
      -- If you only want to set what is written in this config exactly,
      -- you can set the inherit option:
      ["@keyword.return"] = { fg = "Red", bold = true, inherit = false },
      Constant = { fg = "error" },
      Search = { bg = "gold", inherit = false },
      Keyword = { bold = true, inherit = true },
      TelescopeBorder = { fg = "highlight_high", bg = "none" },
      TelescopeNormal = { bg = "none" },
      TelescopePromptNormal = { bg = "base" },
      TelescopeResultsNormal = { fg = "subtle", bg = "none" },
      TelescopeSelection = { fg = "text", bg = "base" },
      TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
      StatusLine = { bg = "NONE" },
      StatusLineNC = { fg = "subtle", bg = "NONE", blend = 10 },
    },
  },
}
