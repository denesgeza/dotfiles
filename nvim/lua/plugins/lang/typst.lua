return {
  {
    'chomosuke/typst-preview.nvim',
    enabled = Enabled 'typst',
    name = 'typst-browser',
    ft = 'typst',
    version = '1.*',
    opts = {
      invert_colors = 'auto', ---@type 'never' | 'auto' | 'always'
      follow_cursor = true,
      dependencies_bin = {
        ['tinymist'] = 'tinymist',
      },
    },
    config = function(_, opts)
      require('typst-preview').setup(opts)
    end,
    -- keys = {
    --   { '<localleader>p', '<cmd>TypstPreview<cr>', desc = 'Preview' },
    --   { '<localleader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', desc = 'Toggle Cursor' },
    --   { '<localleader>r', '<cmd>TypstPreviewReload<cr>', desc = 'Reload' },
    --   { '<localleader>t', '<cmd>TypstPreviewToggle<cr>', desc = 'Toggle' },
    --   { '<localleader>x', '<cmd>TypstPreviewClose<cr>', desc = 'Close' },
    --   { '<localleader>e', '<cmd>TypstExportPDF<cr>', desc = 'Create PDF' },
    --   { '<localleader>o', '<cmd>OpenPdf<cr>', desc = 'Open PDF' },
    -- },
  },
  {
    -- TODO: To test out
    -- Typst preview in Neovim's floating window
    'al-kot/typst-preview.nvim',
    name = 'typst-nvim',
    enabled = Enabled 'typst',
    opts = {
      -- your config here
    },
  },
}
