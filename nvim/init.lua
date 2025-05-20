Settings = require("config.settings")
Manager = require("config.manager")
Functions = require("config.functions")
_G.Is_Enabled = require("config.functions").is_enabled

-- Disable transparency if in neovide
if vim.g.neovide then
  Settings.transparency = false
end
Functions.safe_require("config.lazy")
Functions.setup_neovim()

-- require("vim._extui").enable({})
