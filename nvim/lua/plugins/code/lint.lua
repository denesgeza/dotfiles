return {
  'mfussenegger/nvim-lint',
  events = { 'BufReadPost', 'BufWritePost', 'InsertLeave' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      python = { 'ruff', 'ty' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
