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
    extensions = {
      spinner = {
        enabled = true, -- This is the default
        opts = {
          style = 'fidget', --- @type "cursor-relative"| "snacks"| "fidget"| "lualine"| "heirline"| "native", "none"
        },
      },
    },
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
          -- close = {
          --   modes = { n = 'q', i = '<C-c>' },
          --   opts = {},
          -- },
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
