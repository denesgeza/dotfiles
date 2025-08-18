_G.Settings = require 'config.settings'
_G.Functions = require 'config.functions'

-- Settings
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.statusline'

-- Plugins
require 'pack.colorscheme'
require 'pack.lsp'
require 'pack.mini'
require 'pack.snacks'
require 'pack.ui'
require 'pack.blink'

-- Experimental
require('vim._extui').enable {}
-- vim.print(vim.pack.get())
-- vim.pack.update()
-- vim.pack.del { 'blink.cmp' }
