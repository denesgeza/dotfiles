---@diagnostic disable: missing-fields
local check_html_char = require("config.functions").check_html_char

vim.opt.shiftwidth = 2 ---@type number
vim.opt.tabstop = 2 ---@type number

-- Conform format_on_save
vim.b.disable_autoformat = false ---@type boolean
-- Lazy autoformat
vim.b.autoformat = false ---@type boolean

vim.opt.foldmethod = "indent" ---@type "indent" | "syntax" | "expr" | "diff" | "marker" | "manual"
vim.opt.smartindent = true ---@type boolean

vim.keymap.set("i", "<CR>", check_html_char, { expr = true, noremap = true, silent = true })
