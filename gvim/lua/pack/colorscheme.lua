vim.pack.add {
  { src = 'https://github.com/denesgeza/colorscheme', name = 'geza' },
}
require('geza').setup {
  variant = Settings.background, ---@type "dark" | "light" | "auto"
  dim_inactive_windows = false,
  extend_background_behind_borders = false,
  styles = {
    transparency = Settings.transparency,
    bold = true,
    italic = true,
  },
  highlight_groups = {},
}

vim.cmd 'colorscheme geza'
