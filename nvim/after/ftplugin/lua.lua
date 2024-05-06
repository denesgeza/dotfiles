vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.b.disable_autoformat = false
vim.opt.foldmethod = "marker"
vim.opt_local.foldexpr = "v:lua.require'core.functions'.foldexpr()"
