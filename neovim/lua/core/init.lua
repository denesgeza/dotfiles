local safe_require = require("core.functions").safe_require

Manager = require("core.manager")
vim.cmd("colorscheme" .. " " .. Manager.colorscheme)
safe_require("highlights.common").set_highlights()

if vim.g.colors_name == "default" then
  safe_require("highlights.default").default_colorscheme()
end
safe_require("core.lazy")
safe_require("core.options")
safe_require("core.autocmds")
safe_require("core.keymaps")
