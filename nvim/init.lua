require("config.lazy")
-- NeoVide settings {{{
if vim.g.neovide then
  require("plugins.settings.neovide")
end
-- }}}
-- Plugin settings {{{
require("plugins.settings.statusline")
require("plugins.settings.highlights").set_highlights()
require("config.icons")
require("config.icons").setup()
-- }}}
--
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
