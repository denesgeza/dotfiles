if Enabled 'python' then
  return {
    {
      'benomahony/uv.nvim',
      enabled = Enabled 'uv',
      ft = 'python',
      opts = {
        auto_activate_venv = true,
        auto_commands = true,
        picker_integration = true,
        -- Keymaps to register (set to false to disable)
        keymaps = {
          prefix = '<leader>x', -- Main prefix for uv commands
          commands = false, -- Show uv commands menu (<leader>x)
          run_file = false, -- Run current file (<leader>xr)
          run_selection = false, -- Run selected code (<leader>xs)
          run_function = false, -- Run function (<leader>xf)
          venv = false, -- Environment management (<leader>xe)
          init = false, -- Initialize uv project (<leader>xi)
          add = false, -- Add a package (<leader>xa)
          remove = false, -- Remove a package (<leader>xd)
          sync = true, -- Sync packages (<leader>xc)
        },

        -- Execution options
        execution = {
          -- Python run command template
          run_command = 'uv run python',

          -- Show output in notifications
          notify_output = true,

          -- Notification timeout in ms
          notification_timeout = 10000,
        },
      },
    },
    {
      'nvim-treesitter/nvim-treesitter',
      opts = { ensure_installed = { 'ninja', 'rst', 'python' } },
    },
    {
      'mizisu/django.nvim',
      enabled = Enabled 'django',
      ft = 'python',
      dependencies = {
        { 'folke/snacks.nvim' },
        {
          'saghen/blink.cmp',
          optional = true,
          opts = {
            sources = {
              default = { 'django' },
              providers = {
                django = {
                  name = 'Django',
                  module = 'django.completions.blink',
                  async = true,
                },
              },
            },
          },
        },
      },
      config = function()
        require('django').setup {
          -- Default configuration
          -- views = {
          --   auto_refresh = {
          --     on_picker_open = true,
          --     file_watch_patterns = {
          --       "*/urls.py",
          --       "*/views.py",
          --       "*/view.py",
          --       "*/*views.py",
          --       "*/*view.py",
          --       "*/*viewset.py",
          --       "*/*view_set.py",
          --       "*/*api.py",
          --     },
          --   },
          -- },
          -- models = {
          --   auto_refresh = {
          --     on_picker_open = true,
          --     file_watch_patterns = { "*/models.py", "*/models/*.py" },
          --   },
          -- },
        }
      end,
    },
    -- {
    --   'neovim/nvim-lspconfig',
    --   opts = function(_, opts)
    --     local servers = { 'basedpyright', 'ruff', 'lsp' }
    --     for _, server in ipairs(servers) do
    --       opts.servers[server] = opts.servers[server] or {}
    --       opts.servers[server].enabled = server == 'lsp' or server == 'ruff'
    --     end
    --   end,
    -- },
  }
else
  return {}
end
