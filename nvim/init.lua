require("config.lazy")
-- NeoVide settings {{{
if vim.g.neovide then
  require("plugins.settings.neovide")
end
-- }}}
-- VSCode settings {{{
if vim.g.vscode then
  print("VSCode settings")
  -- require("plugins.settings.vscode")
end
-- }}}
-- Plugin settings {{{
require("plugins.settings.clue")
require("plugins.settings.statusline")
require("plugins.settings.highlights").set_highlights()
-- }}}
-- My plugins {{{
-- vim.opt.rtp:append("~/Projects/stackmap.nvim/")
-- }}}
-- Globals {{{
-- require("plugins.settings.globals")
-- }}}
--
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
