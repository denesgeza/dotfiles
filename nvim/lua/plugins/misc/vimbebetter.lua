return {
  "szymonwilczek/vim-be-better",
  enabled = Is_Enabled("vim_be_better"),
  lazy = false,
  config = function()
    -- Optional: Enable logging for debugging
    vim.g.vim_be_better_log_file = 1
  end,
}
