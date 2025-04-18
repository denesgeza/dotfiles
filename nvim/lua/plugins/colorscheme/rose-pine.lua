Is_Enabled = require("config.functions").is_enabled

return {
  "rose-pine/neovim",
  enabled = Is_Enabled("rose-pine"),
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "main", ---@type "auto" | "moon" | "dawn" | "main"
    dark_variant = Settings.transparency and "moon" or "main", ---@type "moon" | "main"
    dim_inactive_windows = false,
    extend_background_behind_borders = false,

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
      Constant = { fg = "error" },
      Search = { bg = "gold", inherit = false },
      Keyword = { bold = true, inherit = true },
      djangoArgument = { fg = "error", italic = true },
      StatusLine = { bg = "NONE" },
      StatusLineNC = { fg = "subtle", bg = "NONE", blend = 10 },
      PmenuSel = { fg = "surface", bg = "foam" },
    },
  },
}

-- local variants = {
-- 	main = {
-- 		_nc = "#16141f",
-- 		base = "#191724",
-- 		surface = "#1f1d2e",
-- 		overlay = "#26233a",
-- 		muted = "#6e6a86",
-- 		subtle = "#908caa",
-- 		text = "#e0def4",
-- 		love = "#eb6f92",
-- 		gold = "#f6c177",
-- 		rose = "#ebbcba",
-- 		pine = "#31748f",
-- 		foam = "#9ccfd8",
-- 		iris = "#c4a7e7",
-- 		leaf = "#95b1ac",
-- 		highlight_low = "#21202e",
-- 		highlight_med = "#403d52",
-- 		highlight_high = "#524f67",
-- 		none = "NONE",
-- 	},
-- 	moon = {
-- 		_nc = "#1f1d30",
-- 		base = "#232136",
-- 		surface = "#2a273f",
-- 		overlay = "#393552",
-- 		muted = "#6e6a86",
-- 		subtle = "#908caa",
-- 		text = "#e0def4",
-- 		love = "#eb6f92",
-- 		gold = "#f6c177",
-- 		rose = "#ea9a97",
-- 		pine = "#3e8fb0",
-- 		foam = "#9ccfd8",
-- 		iris = "#c4a7e7",
-- 		leaf = "#95b1ac",
-- 		highlight_low = "#2a283e",
-- 		highlight_med = "#44415a",
-- 		highlight_high = "#56526e",
-- 		none = "NONE",
-- 	},
-- 	dawn = {
-- 		_nc = "#f8f0e7",
-- 		base = "#faf4ed",
-- 		surface = "#fffaf3",
-- 		overlay = "#f2e9e1",
-- 		muted = "#9893a5",
-- 		subtle = "#797593",
-- 		text = "#464261",
-- 		love = "#b4637a",
-- 		gold = "#ea9d34",
-- 		rose = "#d7827e",
-- 		pine = "#286983",
-- 		foam = "#56949f",
-- 		iris = "#907aa9",
-- 		leaf = "#6d8f89",
-- 		highlight_low = "#f4ede8",
-- 		highlight_med = "#dfdad9",
-- 		highlight_high = "#cecacd",
-- 		none = "NONE",
-- 	},
-- }
