vim.lsp.config('copilot', {
  settings = {
    telemetry = {
      telemetryLevel = 'off',
    },
  },
})

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

vim.lsp.enable { 'lua_ls', 'copilot' }
