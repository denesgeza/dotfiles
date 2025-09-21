vim.b.autoformat = true
vim.schedule(function()
  vim.opt_local.shiftwidth = 4
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.expandtab = true
  vim.opt_local.foldmethod = 'expr'
  vim.opt_local.foldenable = true
  vim.opt_local.foldlevel = 99
  vim.opt_local.foldlevelstart = 99
end)

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

vim.keymap.set('n', '<localleader>p', '<cmd>TypstPreview<cr>', { desc = 'Preview' })
vim.keymap.set('n', '<localleader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', { desc = 'Toggle Cursor' })
vim.keymap.set('n', '<localleader>r', '<cmd>TypstPreviewReload<cr>', { desc = 'Reload' })
vim.keymap.set('n', '<localleader>t', '<cmd>TypstPreviewToggle<cr>', { desc = 'Toggle' })
vim.keymap.set('n', '<localleader>x', '<cmd>TypstPreviewClose<cr>', { desc = 'Close' })
vim.keymap.set('n', '<localleader>e', '<cmd>TypstExportPDF<cr>', { desc = 'Create PDF' })
vim.keymap.set('n', '<localleader>o', '<cmd>OpenPdf<cr>', { desc = 'Open PDF' })
