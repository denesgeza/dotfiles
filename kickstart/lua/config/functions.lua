Customize = require 'config.customize'
local M = {}

-- {{{ Keymap helper
function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true } ---@type table|nil
  options = vim.tbl_deep_extend('force', options or opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--  }}}
-- {{{ Boooolean helpers
local function _error_handler(err)
  vim.notify(err, 100)
end -- }}}
-- {{{ Returns if a plugin is enabled
local function _is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    vim.notify_once('is_enabled could not find' .. plugin)
    -- require 'notify'('is_enabled could not find ' .. plugin)
  end
  return status and enabled
end

function M.is_debugger(debugger)
  return Customize.debuggers[debugger].enabled
end

function M.in_tmux()
  return os.getenv 'TMUX' ~= nil
end

-- Use plugin defaults settings
function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end -- }}}
-- {{{ HTML indent
function M.check_html_char()
  local prev_col, next_col = vim.fn.col '.' - 1, vim.fn.col '.' ---@type number
  local prev_char = vim.fn.getline('.'):sub(prev_col, prev_col)
  local next_char = vim.fn.getline('.'):sub(next_col, next_col)

  if prev_char:match '>' and next_char:match '<' then
    return '<cr><esc>ko'
  else
    return '<cr>'
  end
end -- }}}
-- {{{ Toggle background
function M.toggle_background()
  vim.o.background = vim.o.background == 'light' and 'dark' or 'light'
  -- Reset highlights
  require('plugins.highlights').set_highlights()
  -- Force reload of colorscheme vim.g.colors_name.tostring()
  if vim.g.colors_name == 'default' then
    vim.cmd 'colorscheme default'
  end
  print('Background: ' .. vim.o.background)
end
-- }}}
-- {{{ StatusLine
-- Check if autoformat si enabled for the current buffer
function M.format_enabled()
  if vim.b.disable_autoformat and not vim.b.autoformat then
    return ' '
  else
    return ''
  end
end

-- Show search in lualine
function M.search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg '/'
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

-- Show current buffer modified status
function M.modified()
  if vim.bo.modified then
    return '[+]'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '[R]'
  end
  return ''
end
-- }}}
-- {{{ Clear registers
function M.ClearReg()
  print 'Clearing registers'
  vim.cmd [[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
]]
end
--  }}}

return M