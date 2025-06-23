return {
  -- "https://github.com/denesgeza/colorscheme",
  dir = "~/Documents/GitHub/my-colorscheme/",
  dev = true,
  enabled = true,
  name = "geza",
  lazy = false,
  priority = 1000,
  opts = {
    variant = Settings.background, ---@type "dark" | "light" | "auto"
    dim_inactive_windows = false,
    extend_background_behind_borders = false,
    styles = {
      transparency = Settings.transparency,
      bold = true,
      italic = true,
    },
    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
      -- ColorColumn = { bg = "rose" },
      --
      -- -- Blend colours against the "base" background
      -- CursorLine = { bg = "foam", blend = 10 },
      --
      -- -- By default each group adds to the existing config.
      -- -- If you only want to set what is written in this config exactly,
      -- -- you can set the inherit option:
      -- Constant = { fg = "error" },
      -- Search = { bg = "gold", inherit = false },
      -- Keyword = { bold = true, inherit = true },
      -- StatusLine = { bg = "NONE" },
      -- StatusLineNC = { fg = "subtle", bg = "NONE", blend = 10 },
      -- PmenuSel = { fg = "surface", bg = "foam" },
    },
  },
}
