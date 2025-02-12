return {
  "rjshkhr/shadow.nvim",
  enabled = Is_Enabled("shadow"),
  lazy = false,
  priority = 1000,
  config = function()
    local c = {}
    c.normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
    c.normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
    c.cursoline_bg = vim.fn.synIDattr(vim.fn.hlID("CursorLine"), "bg")
    c.cursoline_fg = vim.fn.synIDattr(vim.fn.hlID("CursorLine"), "fg")
    vim.opt.termguicolors = true
    vim.api.nvim_set_hl(0, "Normal", { fg = c.normal_fg, bg = c.normal_bg })
    vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.normal_fg, bg = c.cursoline_bg, reverse = true })
    vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = c.normal_fg, bg = "#908caa", reverse = true })
  end,
}
