---@alias Term "unknown" | "kitty" | "ghostty" | ""
local M = {}

-- {{{ Keymap helper
function M.keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true } ---@type table
  options = vim.tbl_deep_extend('force', options, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--  }}}
-- {{{ Boooolean helpers
local function _error_handler(err)
  vim.notify(err, vim.log.levels.ERROR, { title = 'Error' })
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
    vim.notify('Error loading module: ' .. module, vim.log.levels.ERROR, { title = 'Error' })
  end
end
-- }}}
-- {{{ Enable/disable plugin
function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    vim.notify('is_enabled could not find ' .. plugin, vim.log.levels.ERROR)
  end
  return status and enabled
end -- }}}
-- {{{ Use plugin defaults settings
function M.use_plugin_defaults(plugin)
  return Manager.plugins[plugin].defaults or false
end -- }}}
-- {{{ Check if in windows
function M.is_win()
  return vim.uv.os_uname().sysname:find 'Windows' ~= nil
end
-- }}}
-- {{{ Check if in tmux
function M.in_tmux()
  return os.getenv 'TMUX' ~= nil
end
-- }}}
-- {{{ Check if in zellij
function M.in_zellij()
  return os.getenv 'ZELLIJ' ~= nil
end
-- }}}
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
end
-- }}}
-- {{{ Toggle background
function M.toggle_background()
  vim.o.background = vim.o.background == 'light' and 'dark' or 'light'
  -- Reset highlights
  require('settings.highlights.default').default_colorscheme()
  -- Force reload of colorscheme vim.g.colors_name.tostring()
  if vim.g.colors_name == 'default' then
    vim.cmd 'colorscheme default'
  end
  vim.notify('Background: ' .. vim.o.background, vim.log.levels.INFO, { title = 'Settings' })
end
-- }}}
-- {{{ Toggle virtual lines for LSP diagnostics
function M.toggle_virtual_lines()
  if vim.diagnostic.config().virtual_lines then
    vim.diagnostic.config { virtual_lines = false }
    vim.notify('Virtual lines disabled', vim.log.levels.INFO, { title = 'Diagnostics' })
  else
    vim.diagnostic.config { virtual_lines = true }
    vim.notify('Virtual lines enabled', vim.log.levels.INFO, { title = 'Diagnostics' })
  end
end
-- }}}
-- {{{ Toggle virtual text for LSP diagnostics
function M.toggle_virtual_text()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config { virtual_text = false }
    vim.notify('Virtual text disabled', vim.log.levels.INFO, { title = 'Diagnostics' })
  else
    vim.diagnostic.config { virtual_text = true }
    vim.notify('Virtual text enabled', vim.log.levels.INFO, { title = 'Diagnostics' })
  end
end
-- }}}
-- {{{ Terminal INFO
function M.get_terminal_info()
  local term = vim.env.TERM or ''
  local term_program = vim.env.TERM_PROGRAM or ''
  local is_ghostty = term:lower():find 'ghostty' or term_program:lower():find 'ghostty'
  local is_kitty = term:lower():find 'kitty' or term_program:lower():find 'kitty'

  ---@alias terminal Term
  local terminal = 'unknown'
  ---@alias background Background
  local background = 'unknown'
  if is_ghostty then
    terminal = 'ghostty'
  elseif is_kitty then
    terminal = 'kitty'
  end

  local system_bg = 'unknown'
  local kitty_bg = 'unknown'

  -- Check system background
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'

  if handle then
    local result = handle:read '*a'
    handle:close()
    local is_dark = result:match 'Dark' ~= nil
    if is_dark then
      system_bg = 'dark'
    else
      system_bg = 'light'
    end
  end

  if terminal == 'kitty' then
    kitty_bg = vim.env.NVIM_KITTY_BG_COLOR
    background = kitty_bg
  else
    background = system_bg
  end
  vim.o.background = background

  return {
    terminal = terminal,
    background = background,
  }
end
-- }}}
-- {{{ Lualine
-- Check if autoformat si enabled for the current buffer
function M.format_enabled()
  if vim.b.autoformat or vim.g.autoformat then
    return ' '
  else
    return ''
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
-- {{{ Check OS
function M.is_wsl()
  local proc_version = '/proc/version'
  if vim.fn.filereadable(proc_version) == 1 then
    local lines = vim.fn.readfile(proc_version)
    for _, line in ipairs(lines) do
      if string.match(line:lower(), 'microsoft') then
        return true
      end
    end
  end
  return false
end

function M.is_windows()
  return vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1
end

function M.is_macos()
  return vim.fn.has 'mac' == 1
end
---}}}
-- {{{ Get highlight color
function M.get_color(hl, type)
  return vim.fn.synIDattr(vim.fn.hlID(hl), type)
end
--}}}
-- {{{ Set background based on time of day
function M.background()
  local hour = tonumber(os.date '%H')
  if hour >= 7 and hour < 19 then
    return 'light'
  else
    return 'dark'
  end
end
--}}}
-- {{{ Statusline
function M.set_statusline()
  if Settings.statusline.style == 'on' then
    require 'settings.statusline'
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 1
    vim.opt.showmode = false
  elseif Settings.statusline.style == 'off' then
    vim.opt.laststatus = 0 -- Switch to 1 to show diagnostics in cmdline
    vim.opt.cmdheight = 1
    vim.opt.showmode = true
  end
end

function M.statusline()
  local option
  local title = 'Statusline'
  if vim.opt_global.laststatus:get() == 0 then
    M.set_statusline()
    option = 'Enabled'
  else
    vim.opt.laststatus = 0
    vim.opt.cmdheight = 1
    vim.opt.showmode = true
    option = 'Disabled'
  end
  vim.notify(option .. ' ' .. 'statusline', vim.log.levels.INFO, { title = title })
end
-- }}}
-- {{{ Highlights
function M.set_highlights()
  if Settings.highlights == 'on' then
    -- require("settings.highlights.common").set_highlights()
    dofile(vim.fn.stdpath 'config' .. '/lua/settings/highlights/common.lua').set_highlights()
  elseif Settings.highlights == 'off' then
    vim.cmd 'hi clear'
  elseif Settings.highlights == 'default' then
  end
end
-- }}}
-- {{{ Foldexpression
function M.foldexpr()
  local buf = vim.api.nvim_get_current_buf()
  if vim.b[buf].ts_folds == nil then
    -- as long as we don't have a filetype, don't bother
    -- checking if treesitter is available (it won't)
    if vim.bo[buf].filetype == '' then
      return '0'
    end
    if vim.bo[buf].filetype:find 'dashboard' then
      vim.b[buf].ts_folds = false
    else
      vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
    end
  end
  return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or '0'
end
-- }}}
-- {{{ Setup neovim
function M.setup_neovim()
  local colors = Settings.colorscheme
  vim.cmd('colorscheme ' .. colors)
  -- Check if in neovide
  if vim.g.neovide then
    M.safe_require 'settings.neovide'
  end
  if not vim.g.vscode then
    -- Set statusline
    M.set_statusline()
    -- Set highlights
    M.set_highlights()

    require 'config.autocmd'
    require 'config.keymaps'
    require 'config.options'
    require 'config.lsp'
    require('vim._extui').enable {
      enable = true, -- Whether to enable or disable the UI.
      msg = { -- Options related to the message module.
        ---@type 'cmd'|'msg' Where to place regular messages, either in the
        ---cmdline or in a separate ephemeral message window.
        target = 'cmd',
        timeout = 10000, -- Time a message is visible in the message window.
        --  To see the full message, the g< command can be used.
      },
      cmd = { timeout = 10000 },
    }
  end
end
--}}}

return M

-- vim:tw=120:ts=2:sw=2:fdl=0:fdc=0:fdm=marker:fmr={{{,}}}:ft=lua:fen:
