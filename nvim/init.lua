require("config.lazy")
-- NeoVide settings {{{
if vim.g.neovide then
  require("plugins.settings.neovide")
end
-- }}}
-- Plugin settings {{{
require("plugins.settings.clue")
require("plugins.settings.statusline")
require("plugins.settings.highlights").set_highlights()
require("plugins.settings.dadbod")
-- }}}
--
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.HINT] = "H",
      [vim.diagnostic.severity.INFO] = "I",
    },
  },
})
