-- {{{ Copilot
vim.lsp.config('copilot', {
  settings = {
    telemetry = {
      telemetryLevel = 'off',
    },
  },
})
-- }}}
-- {{{ LuaLS
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completions = {
        callSnippet = 'Replace',
      },
      runtime = {
        version = 'LuaJIT',
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
-- {{{ Tinymist
vim.lsp.config('tinymist', {
  single_file_support = true,
  root_dir = Functions.find_root { '.git', 'main.typ', 'typst.toml' },
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

    vim.api.nvim_create_user_command('TypstExportPDF', function()
      -- local input = vim.api.nvim_buf_get_name(0)
      local input = vim.fn.expand '%:t'
      -- Output file name
      local output = input:gsub('%.typ$', '.pdf')
      vim.cmd('!typst compile ' .. input .. ' ' .. output)
    end, { nargs = '?', complete = 'file' })

    vim.api.nvim_create_user_command('OpenPdf', function()
      local filepath = vim.api.nvim_buf_get_name(0)
      if filepath:match '%.typ$' then
        local pdf_path = filepath:gsub('%.typ$', '.pdf')
        vim.system { 'open', pdf_path }
      end
    end, {})
  end,
})
-- }}}

vim.lsp.enable { 'lua_ls', 'copilot', 'tinymist' }

-- vim:tw=120:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:foldenable:
