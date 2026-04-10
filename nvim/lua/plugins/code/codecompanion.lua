return {
  'olimorris/codecompanion.nvim',
  enabled = Enabled 'codecompanion',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'lalitmee/codecompanion-spinners.nvim', -- Install the spinners extension
    -- 📦 Optional dependencies for certain spinner styles:
    'j-hui/fidget.nvim',
    -- "folke/snacks.nvim",
  },
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
  opts = {
    -- rocks = { enabled = true },
    extensions = {
      spinner = {
        enabled = true,
        opts = {
          --- @type "cursor-relative"| "snacks"| "fidget"| "lualine"| "heirline"| "native", "none"
          style = Settings.notifications == 'fidget' and 'fidget' or 'native',
        },
      },
    },
    opts = { log_level = 'DEBUG' },
    display = {
      action_palette = { provider = 'default' },
      chat = {
        show_references = true,
        show_header_separator = true,
        show_settings = false,
        icons = { tool_success = '󰸞 ' },
        fold_context = true,
      },
    },
    strategies = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'gpt-5.1',
        },
        roles = { user = 'Geza' },
        keymaps = {
          send = {
            modes = {
              i = { '<CR>', '<C-s>' },
            },
          },
          close = {
            modes = { n = 'q', i = '<C-c>' },
            opts = {},
          },
          completion = {
            modes = { i = '<C-x>' },
          },
        },
        slash_commands = {
          ['buffer'] = {
            keymaps = {
              modes = { i = '<C-b>' },
            },
          },
          ['fetch'] = {
            keymaps = {
              modes = { i = '<C-f>' },
            },
          },
          ['help'] = {
            opts = { max_lines = 1000 },
          },
          ['image'] = {
            keymaps = {
              modes = { i = '<C-i>' },
            },
            opts = { dirs = { '~/Documents/' } },
          },
        },
      },
      inline = {
        adapter = { name = 'copilot' },
      },
    },
  },
  keys = {
    { '<leader>ac', '<CMD>CodeCompanionChat<CR>', desc = 'CC: Chat' },
    { '<leader>aa', '<CMD>CodeCompanionActions<CR>', desc = 'CC: Actions' },
    { '<leader>ai', '<CMD>CodeCompanion<CR>', desc = 'CC: Inline Assistant' },
  },
  init = function()
    -- vim.cmd [[cab cc CodeCompanion]]
    vim.cmd [[
      cnoreabbrev <expr> cc getcmdtype() == ':' && getcmdline() ==# 'cc' ? 'CodeCompanion' : 'cc'
    ]]
    if Settings.notifications == 'fidget' then
      require('config.utils.spinner'):init()
    end
  end,
  config = function(_, opts)
    require('codecompanion').setup(opts)
    require('settings.codecompanion_extmarks').setup()
  end,
}
