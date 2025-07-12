_G.Settings = require 'config.settings'
_G.Manager = require 'config.manager'
_G.Functions = require 'config.functions'
_G.Enabled = require('config.functions').is_enabled

if vim.g.neovide then
  Settings.transparency = false
end

Functions.safe_require 'config.lazy'
Functions.setup_neovim()
