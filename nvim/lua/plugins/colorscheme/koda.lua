return {
  'oskarnurm/koda.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  enabled = Enabled 'koda',
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    transparent = Settings.transparency,
  },
  -- config = function()
  --   -- require("koda").setup({ transparent = true })
  --   -- vim.cmd("colorscheme koda")
  -- end,
}
