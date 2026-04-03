---@diagnostic disable: missing-fields
local check_html_char = require('config.functions').check_html_char
vim.opt_local.number = true ---@type boolean
vim.opt_local.relativenumber = true ---@type boolean

vim.opt.shiftwidth = 2 ---@type number
vim.opt.tabstop = 2 ---@type number

vim.b.autoformat = true ---@type boolean

vim.opt.foldmethod = 'indent' ---@type "indent" | "syntax" | "expr" | "diff" | "marker" | "manual"
vim.opt.smartindent = true ---@type boolean

vim.keymap.set('i', '<CR>', check_html_char, { expr = true, noremap = true, silent = true })
