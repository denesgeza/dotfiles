return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  lazy = false,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    -- require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.sessions').setup()
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
        norg = { glyph = '', hl = 'MiniIconsAzure' },
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
  end,
}
