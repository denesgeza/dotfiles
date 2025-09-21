return {
  'garymjr/nvim-snippets',
  enabled = false,
  dependencies = { 'rafamadriz/friendly-snippets' },
  event = 'InsertEnter',
  opts = {
    create_cmp_source = false,
    friendly_snippets = true,
    create_autocmd = true,
    extended_filetypes = {
      html = { 'htmldjango' },
    },
  },
  keys = {
    {
      '<Tab>',
      function()
        if vim.snippet.active { direction = 1 } then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
          return
        end
        return '<Tab>'
      end,
      expr = true,
      silent = true,
      mode = 'i',
    },
    {
      '<Tab>',
      function()
        vim.schedule(function()
          vim.snippet.jump(1)
        end)
      end,
      expr = true,
      silent = true,
      mode = 's',
    },
    {
      '<S-Tab>',
      function()
        if vim.snippet.active { direction = -1 } then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
          return
        end
        return '<S-Tab>'
      end,
      expr = true,
      silent = true,
      mode = { 'i', 's' },
    },
  },
}
