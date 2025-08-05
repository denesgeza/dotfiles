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

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('grn', vim.lsp.buf.rename, 'Rename')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('gra', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })

    --  For example, in C this would take you to the header.
    map('grD', vim.lsp.buf.declaration, 'Goto Declaration')

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, ev.buf, {
        autotrigger = true,
        -- Optional formating of items
        -- Optional formating of items
        convert = function(item)
          -- Remove leading misc chars for abbr name,
          -- and cap field to 25 chars
          --local abbr = item.label
          --abbr = abbr:match("[%w_.]+.*") or abbr
          --abbr = #abbr > 25 and abbr:sub(1, 24) .. "…" or abbr
          --
          -- Remove return value
          --local menu = ""

          -- Only show abbr name, remove leading misc chars (bullets etc.),
          -- and cap field to 15 chars
          local abbr = item.label
          abbr = abbr:gsub('%b()', ''):gsub('%b{}', '')
          abbr = abbr:match '[%w_.]+.*' or abbr
          abbr = #abbr > 15 and abbr:sub(1, 14) .. '…' or abbr

          -- Cap return value field to 15 chars
          local menu = item.detail or ''
          menu = #menu > 15 and menu:sub(1, 14) .. '…' or menu

          return { abbr = abbr, menu = menu }
        end,
      })
    end
    if client and client:supports_method 'textDocument/documentColor' then
      vim.lsp.document_color.enable(true, ev.buf)
    end

    if client and client:supports_method 'textDocument/documentHighlight' then
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
  end,
})

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
  virtual_lines = true,
}
-- vim: fdm=marker
