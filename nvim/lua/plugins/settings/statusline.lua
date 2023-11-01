-- Inspired by:
-- https://github.com/kristijanhusak/neovim-config/blob/3448291f22ecfca1f6dab2f0061cbeca863664dd/nvim/lua/partials/statusline.lua
-- https://github.com/matu3ba/dotfiles/blob/master/.config/nvim/lua/my_statusline.lua
-- luacheck: globals vim
-- luacheck: no max line length
local functions = require("config.functions")
local _, plenary = pcall(require, "plenary")
-- local has_navic, navic = pcall(require, "nvim-navic")
local statusline = {}
local statusline_group = vim.api.nvim_create_augroup("custom_statusline", { clear = true })

-- Set statusline if lualine is not enabled
if not Is_Enabled("lualine") then
  vim.o.statusline = "%!v:lua.require'plugins.settings.statusline'.setup()"
end

local c = {}
local lsp = {
  message = "",
  printed_done = false,
}

function statusline.set_colors()
  c.normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
  c.normal_fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
  c.statusline_bg = vim.fn.synIDattr(vim.fn.hlID("Statusline"), "bg")
  c.comment_fg = vim.fn.synIDattr(vim.fn.hlID("Comment"), "fg")
  c.warning_fg = vim.fn.synIDattr(vim.fn.hlID("WarningMsg"), "fg")
  c.error_fg = vim.fn.synIDattr(vim.fn.hlID("ErrorMsg"), "fg")
  c.lazy_special_fg = vim.fn.synIDattr(vim.fn.hlID("Special"), "fg")
  pcall(vim.api.nvim_set_hl, 0, "StItem", { bg = c.normal_fg, fg = c.normal_bg })
  pcall(vim.api.nvim_set_hl, 0, "StItem2", { bg = "#45475a", fg = "#b8c0e0" })
  pcall(vim.api.nvim_set_hl, 0, "StSep", { bg = c.statusline_bg, fg = c.normal_fg, blend = 100 })
  pcall(vim.api.nvim_set_hl, 0, "StSep2", { bg = c.statusline_bg, fg = "#45475a" })
  pcall(vim.api.nvim_set_hl, 0, "StErr", { bg = c.error_fg, fg = "#383a42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StErrSep", { bg = c.statusline_bg, fg = c.error_fg })
  pcall(vim.api.nvim_set_hl, 0, "StWarn", { bg = "#fab387", fg = "#383a42", bold = true })
  pcall(vim.api.nvim_set_hl, 0, "StWarnSep", { bg = c.statusline_bg, fg = "#fab387" })
  pcall(vim.api.nvim_set_hl, 0, "StAdded", { bg = "#45475a", fg = "#8ec07c" })
  pcall(vim.api.nvim_set_hl, 0, "StChanged", { bg = "#45475a", fg = c.warning_fg })
  pcall(vim.api.nvim_set_hl, 0, "StRemoved", { bg = "#45475a", fg = c.normal_bg })
  pcall(vim.api.nvim_set_hl, 0, "StSpecial", { bg = "#45475a", fg = c.lazy_special_fg })
end

local function print_lsp_progress(opts)
  local progress_item = opts.data.result.value
  local client = vim.lsp.get_clients({ id = opts.data.client_id })[1]

  if progress_item.kind == "end" then
    lsp.message = progress_item.title
    vim.defer_fn(function()
      lsp.message = ""
      lsp.printed_done = true
      vim.cmd.redrawstatus()
    end, 1000)
    return
  end

  if progress_item.kind == "begin" or progress_item.kind == "report" then
    local percentage = progress_item.percentage or 0
    local message_text = ""
    local percentage_text = ""
    if percentage > 0 then
      percentage_text = (" - %d%%%%"):format(percentage)
    end
    if progress_item.message then
      message_text = (" (%s)"):format(progress_item.message)
    end
    lsp.message = ("%s: %s%s%s"):format(client.name, progress_item.title, message_text, percentage_text)
    vim.cmd.redrawstatus()
  end
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = statusline_group,
  pattern = "*",
  callback = statusline.set_colors,
})

if vim.fn.has("nvim-0.10.0") > 0 then
  vim.api.nvim_create_autocmd({ "LspProgress" }, {
    group = statusline_group,
    callback = print_lsp_progress,
  })
end

local function sep(item, opts, show)
  opts = opts or {}
  if show == nil then
    show = true
  end
  if not show then
    return ""
  end
  local no_after = opts.no_after or false
  local no_before = opts.no_before or false
  local sep_color = opts.sep_color or "%#StSep#"
  local color = opts.color or "%#StItem#"
  local side = opts.side or "left"

  local sep_before = "█"
  local sep_after = "█"
  if side ~= "left" then
    sep_before = "█"
    sep_after = "█"
  end

  if no_before then
    sep_before = "█"
  end

  if no_after then
    sep_after = "█"
  end

  return sep_color .. sep_before .. color .. item .. sep_color .. sep_after .. "%*"
end

local st_mode = { color = "%#StMode#", sep_color = "%#StModeSep#", no_before = true }
local st_mode_right = vim.tbl_extend("force", st_mode, { side = "right", no_before = false })
local sec_2 = { color = "%#StItem2#", sep_color = "%#StSep2#" }
local sec_2_red = { color = "%#StErr#", sep_color = "%#StErrSep#" }
local right_start_special = { color = "%#Special#", sep_color = "%#StSep2#" }
local st_err = { color = "%#StErr#", sep_color = "%#StErrSep#" }
local st_err_right = vim.tbl_extend("force", st_err, { side = "right" })
local st_warn = { color = "%#StWarn#", sep_color = "%#StWarnSep#", side = "right", no_after = true }

local function format_active()
  if vim.b.disable_autoformat then
    return vim.tbl_extend("force", sec_2, { side = "right", no_before = false })
  end
  return vim.tbl_extend("force", st_mode, { side = "right", no_before = false })
end

local function mode_highlight(mode)
  if mode == "i" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#83a598", fg = "#3c3836" })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#83a598" })
  elseif vim.tbl_contains({ "v", "V", "" }, mode) then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#fe8019", fg = "#3c3836" })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#fe8019" })
  elseif mode == "R" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#E46876", fg = "#3c3836" })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#E46876" })
  elseif mode == "c" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#cba6f7", fg = "#3c3836" })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#cba6f7" })
  elseif mode == "n" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#2D4F67", fg = "#f3f3f3" })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#2D4F67" })
  else
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = c.normal_fg, fg = c.normal_bg })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = c.normal_fg, bg = c.statusline_bg })
  end
end

local function mode_statusline()
  local mode = vim.fn.mode()
  mode_highlight(mode)
  local modeMap = {
    n = "NORMAL",
    i = "INSERT",
    R = "REPLACE",
    v = "VISUAL",
    V = "V-LINE",
    c = "COMMAND",
    [""] = "V-BLOCK",
    s = "SELECT",
    S = "S-LINE",
    [""] = "S-BLOCK",
    t = "TERMINAL",
  }

  return modeMap[mode] or "UNKNOWN"
end

local function with_icon(value, icon)
  if not value then
    return value
  end
  return icon .. " " .. value
end

local function git_statusline()
  local result = {}
  if vim.b.gitsigns_head then
    table.insert(result, vim.b.gitsigns_head)
  elseif vim.g.gitsigns_head then
    table.insert(result, vim.g.gitsigns_head)
  end

  local signs = ""
  local stats = {}
  if vim.b.gitsigns_status then
    local added = vim.b.gitsigns_status_dict.added
    local changed = vim.b.gitsigns_status_dict.changed
    local removed = vim.b.gitsigns_status_dict.removed
    if added and added > 0 then
      table.insert(stats, "%#StAdded# " .. tostring(added))
    end
    if changed and changed > 0 then
      table.insert(stats, "%#StChanged# " .. tostring(changed))
    end
    if removed and removed > 0 then
      table.insert(stats, "%#StRemoved# " .. tostring(removed))
    end
  end

  signs = table.concat(stats, " ")
  if #result == 0 then
    signs = ""
  end
  return with_icon(table.concat(result, " "), ""), signs
end

-- local function get_context()
--   -- idea: non-lsp context retrieval for simple languages?
--   if not has_navic or not navic.is_available(0) then
--     return ""
--   end
--   local data = navic.get_data()
--   if data == nil or next(data) == nil then
--     return ""
--   end
--   local data_1 = data[1]
--   if data_1 ~= nil and data_1["name"] ~= nil then
--     if data_1["icon"] ~= nil then
--       return data_1["icon"] .. data_1["name"]
--     else
--       return data_1["name"]
--     end
--   else
--     return ""
--   end
-- end

local function get_path()
  -- rel_path is absolute, when path not within cwd
  -- plenary handles for us gracefully uris
  local bufname = vim.api.nvim_buf_get_name(0)
  -- neovim should always return valid path and unlist the buffer instead, but if it fails, use
  -- if bufname == nil then return "[DELETED]" end
  local rel_path = plenary.path:new(bufname):make_relative()
  if #rel_path < (vim.fn.winwidth(0) / 4) then
    return rel_path
  end
  return vim.fn.pathshorten(rel_path)
end

function statusline.search_result()
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

local function lsp_diagnostics()
  local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  -- TODO: add info and hint count
  local items = {}

  if hint_count > 0 then
    table.insert(
      items,
      sep(" " .. hint_count, vim.tbl_extend("keep", { no_after = warn_count == 0 }, st_err_right), hint_count > 0)
    )
  end

  if info_count > 0 then
    table.insert(
      items,
      sep(" " .. info_count, vim.tbl_extend("keep", { no_after = warn_count == 0 }, st_err_right), hint_count > 0)
    )
  end

  if err_count > 0 then
    table.insert(
      items,
      sep(" " .. err_count, vim.tbl_extend("keep", { no_after = warn_count == 0 }, st_err_right), err_count > 0)
    )
  end

  if warn_count > 0 then
    table.insert(items, sep(" " .. warn_count, st_warn, warn_count > 0))
  end

  return table.concat(items, "")
end

local function get_modified_count()
  local bufnr = vim.api.nvim_get_current_buf()
  return #vim.tbl_filter(function(buf)
    return buf.listed
      and buf.changed
      and buf.bufnr ~= bufnr
      and vim.api.nvim_get_option_value("buftype", { buf = buf.bufnr }) ~= "terminal"
  end, vim.fn.getbufinfo({ bufmodified = 1, buflisted = 1, bufloaded = 1 }))
end

local function get_updates()
  local updates = require("lazy.status").has_updates()
  if updates == false then
    return ""
  end
  return "%#StSpecial#" .. "  UPD "
end

local function statusline_active()
  local mode = mode_statusline()
  local git_status, signs = git_statusline()
  local search = statusline.search_result()
  local db_ui = vim.g.loaded_dbui and vim.fn["db_ui#statusline"]() or ""
  local ft = vim.bo.filetype
  local diagnostics = lsp_diagnostics()
  local modified_count = get_modified_count()
  local lazy = get_updates()
  local format = functions.format_enabled()

  local statusline_sections = {
    sep(mode, st_mode),
    sep(functions.get_name(), sec_2_red, functions.is_active()),
    sep(git_status, sec_2, git_status ~= ""),
    sep(signs, sec_2, signs ~= ""),
    sep(get_path(), vim.bo.modified and st_err or sec_2),
    -- sep(get_context(), vim.bo.modified and st_err or sec_2),
    sep(("+%d"):format(modified_count), st_err, modified_count > 0),
    sep(" - ", st_err, not vim.bo.modifiable),
    sep("%w", nil, vim.wo.previewwindow),
    sep("%r", nil, vim.bo.readonly),
    sep("%q", nil, vim.bo.buftype == "quickfix"),
    sep(db_ui, sec_2, db_ui ~= ""),
    "%<",
    "%=",
    sep(lsp.message, vim.tbl_extend("keep", { side = "right" }, sec_2), lsp.message ~= ""),
    sep(lazy, vim.tbl_extend("keep", { side = "right" }, right_start_special), lazy ~= ""),
    sep(search, vim.tbl_extend("keep", { side = "right" }, sec_2), search ~= ""),
    sep(ft, vim.tbl_extend("keep", { side = "right" }, sec_2), ft ~= ""),
    -- sep(" " .. os.date("%H:%M", os.time()), st_mode_right),
    -- sep("%4l:%-3c", st_mode_right),
    -- sep("%3p%%/%L", vim.tbl_extend("keep", { no_after = diagnostics == "" }, st_mode_right)),
    sep(format, format_active(), format ~= ""),
    sep(os.date("%H:%M", os.time()), vim.tbl_extend("keep", { no_after = diagnostics == "" }, st_mode_right)),
    diagnostics,
    "%<",
  }

  return table.concat(statusline_sections, "")
end

local function statusline_inactive()
  return [[ %f %m %= %y ]]
end

function statusline.setup()
  local focus = vim.g.statusline_winid == vim.fn.win_getid()
  if focus then
    return statusline_active()
  end
  return statusline_inactive()
end

return statusline
