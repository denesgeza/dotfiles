vim.b.disable_autoformat = false
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
-- if you are a heavy user of folds, consider the using nvim-ufo plugin
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.require'core.functions'.foldexpr()"
vim.opt_local.foldlevel = 1

-- vim.opt_local.colorcolumn = "100"

-- automatically capitalize boolean values. Useful if you come from a
-- different language, and lowercase them out of habit.
vim.cmd.inoreabbrev("<buffer> true True")
vim.cmd.inoreabbrev("<buffer> false False")

-- in the same way, we can fix habits regarding comments or None
-- vim.cmd.inoreabbrev("<buffer> -- #")
vim.cmd.inoreabbrev("<buffer> null None")
vim.cmd.inoreabbrev("<buffer> none None")
vim.cmd.inoreabbrev("<buffer> nil None")