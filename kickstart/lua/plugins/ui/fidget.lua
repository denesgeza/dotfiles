return {
  'j-hui/fidget.nvim',
  lazy = false,
  opts = {
    progress = {
      display = {
        render_limit = 16, -- How many LSP messages to show at once
        done_ttl = 8, -- How long a message should persist after completion
        done_icon = ' ', -- Icon shown when all LSP progress tasks are complete
      },
    },
    notification = {
      poll_rate = 10, -- How frequently to update and render notifications
      filter = vim.log.levels.INFO, -- Minimum notifications level
      history_size = 128, -- Number of removed messages to retain in history
      override_vim_notify = true, -- Automatically override vim.notify() with Fidget
    },
  },
}
