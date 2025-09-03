vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.nvim' },
}

-- {{{ Toggle mini.pairs
local function toggle_mini_pairs()
  if vim.g.minipairs_disable then
    vim.g.minipairs_disable = false
    vim.notify('Mini pairs enabled', vim.log.levels.INFO, { title = 'Mini Pairs' })
  else
    vim.g.minipairs_disable = true
    vim.notify('Mini pairs disabled', vim.log.levels.INFO, { title = 'Mini Pairs' })
  end
end
-- }}}

require('mini.ai').setup { n_lines = 500 }
-- require('mini.files').setup()
require('mini.pairs').setup()
require('mini.surround').setup {
  mappings = {
    add = 'ys',
    delete = 'ds',
    find = '',
    find_left = '',
    highlight = '',
    replace = 'cs',
    update_n_lines = '',

    -- Add this only if you don't want to use extended mappings
    suffix_last = '',
    suffix_next = '',
  },
  search_method = 'cover_or_next',
}
require('mini.hipatterns').setup()
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
    codecompanion = { glyph = ' ', hl = 'MiniIconsGreen' },
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

-- stylua: ignore
vim.keymap.set('n', '<leader>up', function() toogle_mini_pairs() end, { desc = 'Toggle Mini Pairs' })
