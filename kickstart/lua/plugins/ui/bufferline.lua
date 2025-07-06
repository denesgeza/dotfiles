return {
  'akinsho/bufferline.nvim',
  lazy = false,
  enabled = Enabled 'bufferline',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      mode = 'buffers', ---@type "buffers" | "tabs"
      themable = true, ---@type boolean
      -- diagnostics = "nvim_lsp", ---@type "nvim_lsp" | "coc" | boolean
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = 'thin', ---@type "slant" | "slope" | "thick" | "thin"
      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon', ---@type "icon" | "underline" | "none"
      },
      buffer_close_icon = '󰅖',
      color_icons = true,
      offsets = {
        {
          filetype = 'snacks_picker_list',
        },
      },
    },
  },
}
