Is_enabled = require("core.functions").is_enabled

return {
  'linux-cultist/venv-selector.nvim',
  enabled = Is_enabled("venv-select"),
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap-python'
  },
  opts = {
    -- Your options go here
    name = "venv",
    -- auto_refresh = false
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>cv', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>cc', '<cmd>VenvSelectCached<cr>' },
  },
}
