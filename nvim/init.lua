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
