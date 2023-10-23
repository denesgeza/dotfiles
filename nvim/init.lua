require("config.lazy")
-- Global settings {{{
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- }}}
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
-- }}}
-- My plugins {{{
-- vim.opt.rtp:append("~/Projects/stackmap.nvim/")
-- }}}
-- Globals {{{
-- require("plugins.settings.globals")
-- }}}
