return {
  "rjshkhr/shadow.nvim",
  enabled = Is_Enabled("shadow"),
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
  end,
}
