return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'main',
  cmd = 'CopilotChat',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    local user = vim.env.USER or 'User'
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      headers = {
        user = '  ' .. user .. '  ',
        assistant = '  Copilot  ', -- Header to use for AI answers
        tool = '## Tool ', -- Header to use for tool calls
      },
      -- model = 'claude-sonnet-4',
      model = 'gpt-5', -- AI model to use
      agent = 'copilot',
      auto_insert_mode = true,
      insert_at_end = false, -- Move cursor to end of buffer when inserting text
      window = { width = 0.4 },
    }
  end,
  keys = {
    { '<c-s>', '<CR>', ft = 'copilot-chat', desc = 'Submit Prompt', remap = true },
    { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
    {
      '<leader>aa',
      function()
        return require('CopilotChat').toggle()
      end,
      desc = 'Toggle (CopilotChat)',
      mode = { 'n', 'v' },
    },
    {
      '<leader>ax',
      function()
        return require('CopilotChat').reset()
      end,
      desc = 'Clear (CopilotChat)',
      mode = { 'n', 'v' },
    },
    {
      '<leader>aq',
      function()
        vim.ui.input({
          prompt = 'Quick Chat: ',
        }, function(input)
          if input ~= '' then
            require('CopilotChat').ask(input)
          end
        end)
      end,
      desc = 'Quick Chat (CopilotChat)',
      mode = { 'n', 'v' },
    },
    {
      '<leader>am',
      function()
        require('CopilotChat').select_model()
      end,
      desc = 'Models (CopilotChat)',
      mode = { 'n', 'v' },
    },
    {
      '<leader>ap',
      function()
        require('CopilotChat').select_prompt()
      end,
      desc = 'Prompt Actions (CopilotChat)',
      mode = { 'n', 'v' },
    },
  },
  config = function(_, opts)
    local chat = require 'CopilotChat'

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'copilot-chat',
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
