Manager = require("core.manager")
require("core")

vim.cmd("colorscheme" .. " " .. Manager.colorscheme)

require("colorscheme.common").set_highlights()
