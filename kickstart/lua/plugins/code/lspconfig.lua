return {
  'neovim/nvim-lspconfig',
  ft = '*',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- Check if blink.cmp is available and merge capabilities
    local ok, blink = pcall(require, 'blink.cmp')
    if ok then
      capabilities = vim.tbl_deep_extend('force', capabilities, blink.get_lsp_capabilities())
    end

    -- Add onTypeFormatting capability for blink.cmp compatibility
    capabilities.textDocument.onTypeFormatting = { dynamicRegistration = false }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- keymaps {{{
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('grn', vim.lsp.buf.rename, 'Rename')
        map('gra', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
        map('grd', vim.lsp.buf.declaration, 'Declaration')
        map('gri', vim.lsp.buf.implementation, 'Implementation', { 'n', 'x' })
        map('grr', vim.lsp.buf.references, 'References', { 'n', 'x' })
        map('grt', vim.lsp.buf.type_definition, 'Type Definition', { 'n', 'x' })
        -- }}}
        if client then
          -- Document colors highlighting {{{
          if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentColor) then
            vim.lsp.document_color.enable(true, event.buf)
          end -- }}}
          -- On-type formatting {{{
          if client:supports_method(vim.lsp.protocol.Methods.textDocument_onTypeFormatting) then
            -- NOTE: This can be used globally also enabling for all servers
            -- It doesn't have to be on the on_attach event
            vim.lsp.on_type_formatting.enable()
          end -- }}}
          -- Words highlighting {{{
          if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end -- }}}
          -- Inlay hints {{{
          if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>uh', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Inlay [H]ints')
          end
          --}}}
          -- Native completion {{{
          if Settings.snippets_engine == 'native' then
            if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
              vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
              vim.o.autocomplete = true
              vim.o.pumheight = 7
              vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
            end
          end
          -- }}}
          -- Inline completion (like copilot) {{{
          -- NOTE: Need to be signed on with command: `LspCopilotSignIn`
          if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.inline_completion.enable(true)
            vim.keymap.set('i', '<C-;>', function()
              if not vim.lsp.inline_completion.get() then
                return '<C-;>'
              end
            end, {
              expr = true,
              replace_keycodes = true,
              desc = 'Get the current inline completion',
            })
          end -- }}}
        end
      end,
    })

    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = {},
    }
    require('mason-lspconfig').setup()
    -- require('mason-lspconfig').setup {
    --   ensure_installed = { 'ruff', 'basedpyright', 'biome' },
    --   automatic_enable = {
    --     exclude = { 'tinymist' },
    --   },
    -- }
  end,
}
-- vim:tw=120:ts=2:sw=2:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:fen:
