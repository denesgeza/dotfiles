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
    lsp_format = 'fallback', ---@type "first" | "last" | "fallback" | "never" | "prefer" | "only"
    stop_after_first = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, htmldjango = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters = {
      typstyle = { args = { '-t', '4', '-l', '100' } },
    },
    formatters_by_ft = {
      -- The available `lsp_format` options are:
      -- - `"first"` - Try LSP first, then formatters
      -- - `"last"` - Try formatters first, then LSP
      -- - `"prefer"` - Use LSP if available, otherwise use formatters (current setting)
      -- - `"fallback"` - Use formatters if available, otherwise use LSP
      -- - `"only"` - Use only LSP formatting
      -- - `"never"` - Never use LSP formatting
      ['*'] = { 'trim_whitespace', 'trim_newlines' },
      lua = { 'stylua', lsp_format = 'prefer' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      htmldjango = { 'prettierd' },
      json = { 'jq' },
      sh = { 'shfmt' },
      sql = { 'sqlfmt' },
      yaml = { 'yamlfmt' },
      zsh = { 'beautysh' },
      rust = { 'rustfmt' },
      tex = { 'latexindent' },
      typescript = { 'biome', 'prettierd' },
      typst = { 'typstyle', lsp_format = 'fallback' },
      javascript = { 'biome', 'prettierd' },
      toml = { 'taplo' },
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_organize_imports', 'ruff_format' }
        else
          return { 'isort', 'black' }
        end
      end,
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
  },
}
