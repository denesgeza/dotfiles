---@diagnostic disable: missing-fields
local check_html_char = require('config.functions').check_html_char

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.foldmethod = 'indent'
vim.opt.smartindent = true
vim.opt.foldlevel = 10
vim.b.autoformat = false

vim.opt.spell = false

vim.keymap.set('i', '<CR>', check_html_char, { expr = true, noremap = true })
