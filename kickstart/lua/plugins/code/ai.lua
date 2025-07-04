if Settings.AI then
  return {
    {
      'zbirenbaum/copilot.lua',
      enabled = true,
      verylazy = true,
      cmd = 'Copilot',
      build = ':Copilot auth',
      opts = {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-;>',
          },
        },
        panel = { enabled = false },
        -- filetypes = {
        --   markdown = true,
        --   help = true,
        --   lua = true,
        --   bash = true,
        -- },
      },
    },
  }
else
  return {}
end
