vim.opt_local.foldmethod = "expr"
vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.foldlevelstart = 99
vim.opt_local.foldlevel = 1

vim.opt_local.foldexpr = [[vimtex#fold#level(v:lnum)]]
vim.opt_local.foldtext = [[vimtex#fold#text()]]
