Manager = require("config.manager")
local M = {}

-- {{{ Keymap helper
function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true } ---@type table|nil
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--  }}}
-- {{{ Boooolean helpers
local function _error_handler(err) vim.notify(err, vim.log.levels.ERROR) end -- }}}
-- {{{ Returns if a plugin is enabled
local function _is_enabled(plugin) return Manager.plugins[plugin].enabled end
-- }}}
-- {{{ Safe require a lua module
function M.safe_require(module)
  local ok, result = pcall(require, module)
  if ok then
    return result
  else
    print("Error loading module: " .. module)
    print(result)
  end
end
-- }}}
-- {{{
function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then vim.notify("is_enabled could not find " .. plugin, vim.log.levels.ERROR) end
  return status and enabled
end

function M.is_debugger(debugger) return Manager.debuggers[debugger].enabled end

function M.in_tmux() return os.getenv("TMUX") ~= nil end

-- Use plugin defaults settings
function M.use_plugin_defaults(plugin) return Manager.plugins[plugin].defaults or false end -- }}}
-- {{{ HTML indent
function M.check_html_char()
  local prev_col, next_col = vim.fn.col(".") - 1, vim.fn.col(".") ---@type number
  local prev_char = vim.fn.getline("."):sub(prev_col, prev_col)
  local next_char = vim.fn.getline("."):sub(next_col, next_col)

  if prev_char:match(">") and next_char:match("<") then
    return "<cr><esc>ko"
  else
    return "<cr>"
  end
end -- }}}
-- {{{ Toggle background
function M.toggle_background()
  vim.o.background = vim.o.background == "light" and "dark" or "light"
  -- Reset highlights
  require("plugins.settings.highlights").set_highlights()
  -- Force reload of colorscheme vim.g.colors_name.tostring()
  if vim.g.colors_name == "default" then vim.cmd("colorscheme default") end
  print("Background: " .. vim.o.background)
end
-- }}}
-- {{{ Lualine
-- Check if autoformat si enabled for the current buffer
function M.format_enabled()
  if vim.b.disable_autoformat and not vim.b.autoformat then
    return " "
  else
    return ""
  end
end

-- Show search in lualine
function M.search_result()
  if vim.v.hlsearch == 0 then return "" end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then return "" end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

-- Show current buffer modified status
function M.modified()
  if vim.bo.modified then
    return "[+]"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "[R]"
  end
  return ""
end

-- Settings for Hydra {{{
function M.is_active()
  local ok, hydra = pcall(require, "hydra.statusline")
  return ok and hydra.is_active()
end

function M.get_name()
  local ok, hydra = pcall(require, "hydra.statusline")
  if ok then return hydra.get_name() end
  return ""
end -- }}}
-- }}}
-- {{{ Clear registers
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
-- {{{ Remove buffer
function M.bufremove()
  local buf = vim.api.nvim_get_current_buf()

  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 0 then -- Cancel
      return
    end
    if choice == 1 then -- Yes
      vim.cmd.write()
    end
  end

  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.api.nvim_win_call(win, function()
      if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then return end
      -- Try using alternate buffer
      local alt = vim.fn.bufnr("#")
      if alt ~= buf and vim.fn.buflisted(alt) == 1 then
        vim.api.nvim_win_set_buf(win, alt)
        return
      end

      -- Try using previous buffer
      local has_previous = pcall(vim.cmd, "bprevious")
      if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then return end

      -- Create new listed buffer
      local new_buf = vim.api.nvim_create_buf(true, false)
      vim.api.nvim_win_set_buf(win, new_buf)
    end)
  end
  vim.api.nvim_buf_delete(buf, { force = true })
end
-- }}}
-- {{{ Toggle statusline
function M.statusline()
  if vim.opt_global.laststatus:get() == 0 then
    require("settings.statusline")
    vim.opt.laststatus = 2
    vim.opt.cmdheight = 0
    vim.opt.showmode = false
    vim.notify("Enabled statusline", vim.log.levels.INFO)
  else
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 1
    vim.opt.showmode = true
    vim.notify("Disabled statusline", vim.log.levels.WARN)
  end
end
-- }}}

return M
