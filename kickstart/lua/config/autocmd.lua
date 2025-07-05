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
-- Colorscheme {{{
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = Functions.set_highlights,
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
-- LSP attach {{{
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end
    if client:supports_method 'textDocument/documentColor' then
      vim.lsp.document_color.enable(true, ev.buf)
    end
    if Settings.snippets_engine == 'native' then
      if client:supports_method 'textDocument/completion' then
        vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      end
    end
  end,
})
-- }}}
-- Setup LSP servers {{{
local disabled_servers = {
  'ty',
  'tinymist',
  -- "clangd",
}

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    local server_configs = vim
      .iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ':t:r')
      end)
      :totable()
    for _, server in ipairs(disabled_servers) do
      local idx = vim.fn.index(server_configs, server)
      if idx >= 0 then
        table.remove(server_configs, idx + 1)
      end
    end
    vim.lsp.enable(server_configs)
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
-- vim: fdm=marker
