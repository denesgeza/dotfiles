Settings = require("config.settings")
Manager = require("config.manager")
Functions = require("config.functions")
_G.Is_Enabled = require("config.functions").is_enabled

Functions.safe_require("config.lazy")
Functions.setup_neovim()
