Customize = require("config.customize")
local M = {}

-- {{{ Keymap helper

function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--  }}}
-- {{{ Boooolean helpers

local function _error_handler(err)
  require("notify")(err)
end

local function _is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    require("notify")("is_enabled could not find " .. plugin)
  end
  return status and enabled
end

function M.is_debugger(debugger)
  return Customize.debuggers[debugger].enabled
end

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end

function M.check_html_char()
  local prev_col, next_col = vim.fn.col(".") - 1, vim.fn.col(".")
  local prev_char = vim.fn.getline("."):sub(prev_col, prev_col)
  local next_char = vim.fn.getline("."):sub(next_col, next_col)

  if prev_char:match(">") and next_char:match("<") then
    return "<cr><esc>ko"
  else
    return "<cr>"
  end
end

function M.ClearReg()
  print("Clearing registers")
  vim.cmd([[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
]])
end
--  }}}

return M
