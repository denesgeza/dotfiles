-- Copilot {{{
vim.lsp.config('copilot', {
  settings = {
    telemetry = {
      telemetryLevel = 'off',
    },
  },
})
-- }}}
-- LuaLS {{{
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completions = {
        callSnippet = 'Replace',
      },
      runtime = {
        -- version = 'LuaJIT',
        version = 'Lua 5.4',
      },
      diagnostics = {
        globals = { 'vim', 'require' },
        disable = { 'missing-fields' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
-- }}}
-- Tinymist {{{
vim.lsp.config('tinymist', {
  single_file_support = true,
  root_dir = require('lspconfig.util').root_pattern('.git', 'main.typ', 'typst.toml'),
  --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/editors/neovim/Configuration.md) for references.
  settings = {
    --- You could set the formatter mode to use lsp-enhanced formatters.
    formatterMode = 'typstyle',
    exportPdf = 'never', ---@type 'onSave' | 'onType' | 'never'
    sematicTokens = 'enable', ---@type "enable" | "disable"
    formatterPrintWidth = 100, ---@type number
    formatterIndentSize = 4, ---@type number
    projectResolution = 'singleFile', ---@type 'lockDatabase' | 'singleFile'
    completion = {
      triggerOnSnippetPlaceholders = true,
      symbol = 'step', ---@type 'step' | 'stepless
    },
  },
  -- single_file_support = true,
  on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>tp', function()
      client:exec_cmd({
        title = 'pin',
        command = 'tinymist.pinMain',
        arguments = { vim.api.nvim_buf_get_name(0) },
      }, { bufnr = bufnr })
    end, { desc = '[T]inymist [P]in', noremap = true })

    vim.keymap.set('n', '<leader>tu', function()
      client:exec_cmd({
        title = 'unpin',
        command = 'tinymist.pinMain',
        arguments = { vim.v.null },
      }, { bufnr = bufnr })
    end, { desc = '[T]inymist [U]npin', noremap = true })
  end,
})
-- }}}

-- Diagnostic settings {{{
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = false,
  virtual_lines = false,
}
-- }}}
-- Enabled servers {{{
vim.lsp.enable { 'lua_ls', 'copilot', 'tinymist' }
-- }}}
-- vim:tw=120:ts=2:sw=2:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:fen:
