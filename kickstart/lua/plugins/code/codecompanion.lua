return {
  'olimorris/codecompanion.nvim',
  enabled = Enabled 'codecompanion',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
  opts = {
    opts = { log_level = 'DEBUG' },
    display = {
      action_palette = { provider = 'default' },
      chat = {
        -- show_references = true,
        -- show_header_separator = false,
        -- show_settings = false,
        icons = { tool_success = '󰸞 ' },
        fold_context = true,
      },
    },
    strategies = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'gpt-4.1',
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
        adapter = {
          name = 'copilot',
          model = 'gpt-4.1',
        },
      },
    },
    init = function()
      vim.cmd [[cab cc CodeCompanion]]
      require('config.utils.spinner'):init()
    end,
  },
}
