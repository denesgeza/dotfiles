local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
-- Check if we need to reload the file when it changed {{{
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup 'checktime',
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
})
-- }}}
-- Highlight on yank {{{
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = augroup 'highlight_yank',
  callback = function()
    vim.hl.on_yank()
  end,
})
-- }}}
-- Disable comment on save {{{
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
  desc = 'Disable New Line Comment',
})
-- }}}
-- Resize splits if window got resized {{{
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup 'resize_splits',
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})
-- }}}
-- go to last loc when opening a buffer {{{
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup 'last_loc',
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
-- }}}
-- Set `html` filetype to `htmldjango` when opening an html file {{{
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.html",
--   callback = function()
--     vim.cmd("set filetype=htmldjango")
--   end,
-- })
-- }}}
-- close some filetypes with <q> {{{
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'close_with_q',
  pattern = {
    'PlenaryTestPopup',
    'checkhealth',
    'dbout',
    'gitsigns-blame',
    'grug-far',
    'help',
    'lspinfo',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set('n', 'q', function()
        vim.cmd 'close'
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = 'Quit buffer',
      })
    end)
  end,
})
-- }}}
-- make it easier to close man-files when opened inline {{{
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'man_unlisted',
  pattern = { 'man' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})
-- }}}
-- Fix conceallevel for json files {{{
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = augroup 'json_conceal',
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function()
    vim.opt_local.conceallevel = 3
  end,
})
-- }}}
-- Auto create dir when saving a file, in case some intermediate directory does not exist {{{
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup 'auto_create_dir',
  callback = function(event)
    if event.match:match '^%w%w+://' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
-- }}}
-- Disable cursor animation in insert mode in Neovide {{{
if vim.g.neovide then
  vim.api.nvim_create_augroup('NeovideCursorAnimation', { clear = true })
  vim.api.nvim_create_autocmd('InsertEnter', {
    group = 'NeovideCursorAnimation',
    callback = function()
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_vfx_mode = ''
    end,
  })
  vim.api.nvim_create_autocmd('InsertLeave', {
    group = 'NeovideCursorAnimation',
    callback = function()
      vim.g.neovide_cursor_animation_length = 0.05
      vim.g.neovide_cursor_vfx_mode = Settings.neovide.vfx_mode
    end,
  })
end
-- }}}
-- Add $ pair in typst files {{{
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typst',
  callback = function()
    require('mini.pairs').map_buf(0, 'i', '$', { action = 'open', pair = '$$', neigh_pattern = '[^%w\\].' })
  end,
})
-- }}}

-- LSP Attach {{{
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, 'Rename')
    map('gra', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
    map('grD', vim.lsp.buf.declaration, 'Goto Declaration')

    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client then
      if Settings.completion == 'native' then
        -- Enable completion
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
          vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
          vim.o.complete = '.,o' -- use buffer and omnifunc
          -- vim.o.completeopt = 'fuzzy,menuone,noselect' -- add 'popup' for docs (sometimes)
          vim.o.autocomplete = true
          vim.o.pumheight = 7

          vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          vim.keymap.set('i', '<C-Space>', function()
            vim.lsp.completion.get()
          end, { desc = 'Trigger lsp completion' })
        end

        -- Enable LLM-based inline completion
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
        end

        -- Use built-in LSP omnifunc

        -- Add normal-mode keymappings for signature help
        if client:supports_method 'textDocument/signatureHelp' then
          vim.keymap.set('n', '<C-s>', function()
            vim.lsp.buf.signature_help()
          end, { desc = 'Trigger lsp signature help' })
        end
      end

      if client:supports_method 'textDocument/documentColor' then
        vim.lsp.document_color.enable(true, ev.buf)
      end

      if client:supports_method 'textDocument/documentHighlight' then
        local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = ev.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = ev.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
          group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
          callback = function(event2)
            if event2.data.client_id == ev.data.client_id then
              vim.api.nvim_clear_autocmds { group = highlight_augroup, buffer = event2.buf }
            end
          end,
        })
      end

      if client and client:supports_method 'textDocument/inlayHint' then
        map('<leader>uh', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = ev.buf })
        end, 'Inlay [H]ints')
      end
    end
  end,
})
-- vim:tw=120:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:foldenable:
