_G.Settings = require 'config.settings'
_G.Functions = require 'config.functions'

-- Settings
require 'config.options'
require 'config.keymaps'
require 'config.lsp'
require 'config.autocmds'
require 'config.statusline'

-- Plugins
require 'pack.colorscheme'
require 'pack.code'
require 'pack.mini'
require 'pack.snacks'
require 'pack.ui'

if Settings.completion == 'blink' then
  require 'pack.blink'
end

-- Experimental
require('vim._extui').enable {
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Where to place regular messages, either in the
    ---cmdline or in a separate ephemeral message window.
    target = 'cmd',
    timeout = 10000, -- Time a message is visible in the message window.
    --  To see the full message, the g< command can be used.
  },
  cmd = { timeout = 10000 },
}
-- vim.print(vim.pack.get())
-- vim.pack.update()
