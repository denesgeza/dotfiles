Settings = require("config.settings")
Manager = require("config.manager")
Functions = require("config.functions")
Is_Enabled = require("config.functions").is_enabled

local safe_require = require("config.functions").safe_require

safe_require("config.lazy")
-- NeoVide settings {{{
if vim.g.neovide then
  safe_require("settings.neovide")
end
-- }}}
-- Plugin settings {{{
-- Set statusline
Functions.get_correct_statusline()
-- Set common highlights
safe_require("settings.highlights.common").set_highlights()
-- }}}
