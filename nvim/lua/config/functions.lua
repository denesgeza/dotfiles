local M = {}

-- {{{ Keymap helper
function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true } ---@type table
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--  }}}
-- {{{ Boooolean helpers
local function _error_handler(err)
  vim.notify(err, vim.log.levels.ERROR, { title = "Error" })
end
-- }}}
-- {{{ Returns if a plugin is enabled
local function _is_enabled(plugin)
  return Manager.plugins[plugin].enabled
end
-- }}}
-- {{{ Safe require a lua module
function M.safe_require(module)
  local ok, result = pcall(require, module)
  if ok then
    return result
  else
    vim.notify("Error loading module: " .. module, vim.log.levels.ERROR, { title = "Error" })
  end
end
-- }}}
-- {{{ Enable/disable plugin
function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    vim.notify("is_enabled could not find " .. plugin, vim.log.levels.ERROR)
  end
  return status and enabled
end -- }}}
-- {{{ Use plugin defaults settings
function M.use_plugin_defaults(plugin)
  return Manager.plugins[plugin].defaults or false
end -- }}}
-- {{{ Check if in tmux
function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end
-- }}}
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
end
-- }}}
-- {{{ Toggle background
function M.toggle_background()
  vim.o.background = vim.o.background == "light" and "dark" or "light"
  -- Reset highlights
  require("settings.highlights.default").default_colorscheme()
  -- Force reload of colorscheme vim.g.colors_name.tostring()
  if vim.g.colors_name == "default" then
    vim.cmd("colorscheme default")
  end
  vim.notify("Background: " .. vim.o.background, vim.log.levels.INFO, { title = "Settings" })
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
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
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
  if ok then
    return hydra.get_name()
  end
  return ""
end -- }}}
-- }}}
-- {{{ Get highlight color
function M.get_color(hl, type)
  return vim.fn.synIDattr(vim.fn.hlID(hl), type)
end
--}}}
-- {{{ Statusline
function M.set_statusline()
  vim.opt.laststatus = 3
  vim.opt.cmdheight = 0

  if Settings.statusline == "default" then
    require("settings.statusline")
  elseif Settings.statusline == "simple" then
    require("settings.statusline_simple")
  elseif Settings.statusline == "lualine" then
    return
  elseif Settings.statusline == "off" then
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 0
  end
end

function M.statusline()
  local option
  local title = "Statusline"
  if vim.opt_global.laststatus:get() == 0 then
    M.set_statusline()
    vim.opt.showmode = false
    option = "Enabled"
  else
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 0
    vim.opt.showmode = true
    option = "Disabled"
  end
  vim.notify(option .. " " .. "statusline", vim.log.levels.INFO, { title = title })
end
-- }}}
-- {{{ Highlights
function M.set_highlights()
  if Settings.highlights == "on" then
    require("settings.highlights.common").set_highlights()
  elseif Settings.highlights == "off" then
    vim.cmd("hi clear")
  elseif Settings.highlights == "default" then
  end
end
-- }}}
-- {{{ Setup neovim
function M.setup_neovim()
  -- Set statusline
  M.set_statusline()
  -- Set highlights
  M.set_highlights()
  -- Check if in neovide
  if vim.g.neovide then
    M.safe_require("settings.neovide")
  end
end
--}}}

return M

-- vim:foldmethod=marker foldlevel=0 foldenable foldmarker={{{,}}}
