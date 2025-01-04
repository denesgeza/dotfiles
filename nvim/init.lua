Manager = require("config.manager")
local safe_require = require("config.functions").safe_require

safe_require("config.lazy")
-- NeoVide settings {{{
if vim.g.neovide then
  safe_require("settings.neovide")
end
-- }}}
-- Plugin settings {{{
if Manager.statusline == "default" then
  safe_require("settings.statusline")
elseif Manager.statusline == "simple" then
  safe_require("settings.statusline_simple").setup()
end
-- Set common highlights
safe_require("settings.highlights.common").set_highlights()
safe_require("settings.icons")
safe_require("settings.icons").setup()
-- }}}
