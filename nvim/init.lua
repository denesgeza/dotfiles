_G.Settings = require 'config.settings'
_G.Manager = require 'config.manager'
_G.Functions = require 'config.functions'
_G.Enabled = require('config.functions').is_enabled

Functions.safe_require 'config.lazy'
Functions.setup_neovim()
