vim.pack.add {
  { src = 'https://github.com/echasnovski/mini.nvim' },
}

require('mini.ai').setup()
require('mini.files').setup()
require('mini.pairs').setup()
require('mini.sessions').setup()
-- require('mini.statusline').setup()
require('mini.icons').setup {
  style = 'glyph', ---@type 'glyph' | 'ascii'
  -- Customize per category. See `:h MiniIcons.config` for details.
  default = {},
  directory = {
    apps = { glyph = '', hl = 'MiniIconsBlue' },
    config = { glyph = '', hl = 'MiniIconsGreen' },
    settings = { glyph = '', hl = 'MiniIconsGreen' },
    tools = { glyph = '', hl = 'MiniIconsOrange' },
    database = { glyph = '', hl = 'MiniIconsOrange' },
    users = { glyph = '󰉌', hl = 'MiniIconsRed' },
    automation = { glyph = '', hl = 'MiniIconsGreen' },
    static = { glyph = '', hl = 'MiniIconsYellow' },
    templates = { glyph = '', hl = 'MiniIconsRed' },
    css = { glyph = '', hl = 'MiniIconsRed' },
    js = { glyph = '', hl = 'MiniIconsRed' },
    img = { glyph = '', hl = 'MiniIconsRed' },
    vendor = { glyph = '󰛆', hl = 'MiniIconsRed' },
    layouts = { glyph = '', hl = 'MiniIconsAzure' },
    includes = { glyph = '', hl = 'MiniIconsAzure' },
    partials = { glyph = '󰆞', hl = 'MiniIconsAzure' },
  },
  extension = {
    ts = { glyph = '', hl = 'MiniIconsAzure' },
    js = { glyph = '', hl = 'MiniIconsGreen' },
    lock = { glyph = '', hl = 'MiniIconsRed' },
    html = { glyph = '', hl = 'MiniIconsYellow' },
    -- htmldjango = { glyph = "", hl = "MiniIconsRed" },
  },
  file = {},
  filetype = {
    typescript = { glyph = ' ', hl = 'MiniIconsAzure' },
    javascript = { glyph = ' ', hl = 'MiniIconsGreen' },
    ['copilot-chat'] = { glyph = ' ', hl = 'MiniIconsGreen' },
    html = { glyph = ' ', hl = 'MiniIconsYellow' },
    htmldjango = { glyph = ' ', hl = 'MiniIconsRed' },
    norg = { glyph = '', hl = 'MiniIconsAzure' },
    lock = { glyph = ' ', hl = 'MiniIconsRed' },
    snacks_picker_input = { glyph = ' ', hl = 'MiniIconsRed' },
    markdown = { glyph = ' ', hl = 'MiniIconsRed' },
  },
  lsp = {},
  os = {},
}

vim.keymap.set('n', ':MiniFiles.open() <CR>', '<leader>e')
