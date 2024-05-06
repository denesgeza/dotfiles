local safe_require = require("core.functions").safe_require

Manager = require("core.manager")
vim.cmd("colorscheme" .. " " .. Manager.colorscheme)
require("colorscheme.common").set_highlights()

safe_require("core.lazy")
safe_require("core.options")
safe_require("core.autocmds")
safe_require("core.keymaps")
