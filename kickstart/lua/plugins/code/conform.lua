return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    { mode = { 'n' }, '<leader>ci', '<cmd>ConformInfo<cr>', desc = 'Conform Info' },
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    notify_no_formatters = true,
    lsp_format = 'last', ---@type "first" | "last" | "fallback" | "never"
    stop_after_first = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      ['*'] = { 'trim_whitespace', 'trim_newlines' },
      lua = { 'stylua' },
      css = { 'prettierd' },
      lua = { 'stylua' },
      -- Use a sub-list to run only the first available formatter
      html = { 'prettierd' },
      htmldjango = { 'prettierd' },
      json = { 'jq' },
      markdown = { 'markdownlint' },
      sh = { 'shfmt' },
      sql = { 'sqlfmt' },
      yaml = { 'yamlfmt' },
      -- zsh = { "beautysh" },
      rust = { 'rustfmt' },
      tex = { 'latexindent', 'tex-fmt' },
      -- toml = { "taplo" },
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_organize_imports', 'ruff_format' }
        else
          return { 'isort', 'black' }
        end
      end,
    },
  },
}
