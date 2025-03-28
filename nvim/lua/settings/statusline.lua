-- Imports {{{
-- Inspired by:
-- https://github.com/kristijanhusak/neovim-config/blob/3448291f22ecfca1f6dab2f0061cbeca863664dd/nvim/lua/partials/statusline.lua
-- https://github.com/matu3ba/dotfiles/blob/master/.config/nvim/lua/my_statusline.lua
-- luacheck: globals vim
-- luacheck: no max line length
local functions = require("config.functions")
local Statusline = {}

-- }}}
-- Highlight groups {{{
Statusline.normal_fg = functions.get_color("Normal", "fg")
Statusline.normal_bg = functions.get_color("Normal", "bg")
Statusline.special_fg = functions.get_color("DiagnosticError", "fg")

local statusline_highlights = {
  StItem = { bg = Statusline.normal_fg, fg = Statusline.normal_bg },
  StItem2 = { bg = "#45475A", fg = "#B8C0E0" },
  StSep = { bg = "NONE", fg = Statusline.normal_fg, blend = 100 },
  StSep2 = { bg = "NONE", fg = "#45475A" },
  StErr = { bg = "Red", fg = "#383A42", bold = true },
  StErrSep = { bg = "NONE", fg = "Red" },
  StWarn = { bg = "#FF9E3B", fg = "#383A42", bold = true },
  StWarnSep = { bg = "NONE", fg = "#FF9E3B" },
  StHint = { bg = "#8EC07C", fg = "#383A42", bold = true },
  StHintSep = { bg = "NONE", fg = "#8EC07C", bold = true },
  StInfo = { bg = "#8BD5CA", fg = "#383A42", bold = true },
  StInfoSep = { bg = "NONE", fg = "#8BD5CA", bold = true },
  StAdded = { bg = "#45475A", fg = "#8EC07C" },
  StChanged = { bg = "#45475A", fg = "#FF9E3B" },
  StRemoved = { bg = "#45475A", fg = "Red" },
  ErrText = { fg = "Red" },
  StSpecial = { bg = "#45475A", fg = "NvimLightMagenta" },
}

for hl, prop in pairs(statusline_highlights) do
  vim.api.nvim_set_hl(0, hl, prop)
end

-- }}}
-- LSP progress indicator {{{
-- local lsp = {
--   message = "",
--   printed_done = false,
-- }

-- local function print_lsp_progress(opts)
--   local progress_item = opts.data.result.value
--   local client = vim.lsp.get_clients({ id = opts.data.client_id })[1]
--
--   if progress_item.kind == "end" then
--     lsp.message = progress_item.title
--     vim.defer_fn(function()
--       lsp.message = ""
--       lsp.printed_done = true
--       vim.cmd.redrawstatus()
--     end, 1000)
--     return
--   end

--   if progress_item.kind == "begin" or progress_item.kind == "report" then
--     local percentage = progress_item.percentage or 0
--     local message_text = ""
--     local percentage_text = ""
--     if percentage > 0 then
--       percentage_text = (" - %d%%%%"):format(percentage)
--     end
--     if progress_item.message then
--       message_text = (" (%s)"):format(progress_item.message)
--     end
--     lsp.message = ("%s: %s%s%s"):format(client.name, progress_item.title, message_text, percentage_text)
--     vim.cmd.redrawstatus()
--   end
-- end

-- if vim.fn.has("nvim-0.10.0") > 0 then
--   vim.api.nvim_create_autocmd({ "LspProgress" }, {
--     group = statusline_group,
--     callback = print_lsp_progress,
--   })
-- end
-- }}}
-- Separators {{{
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
  local no_sep = opts.no_sep or false

  -- Slanted separators
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

  if no_sep then
    sep_before = ""
    sep_after = ""
  end

  return sep_color .. sep_before .. color .. item .. sep_color .. sep_after .. "%*"
end

local st_mode = { color = "%#StMode#", sep_color = "%#StModeSep#", no_before = true }
local st_mode_right = vim.tbl_extend("force", st_mode, { side = "right", no_before = false })
local sec_2 = { color = "%#StItem2#", sep_color = "%#StSep2#" }
local st_hint = { color = "%#StHint#", sep_color = "%#StHintSep#" }
local st_info = { color = "%#StInfo#", sep_color = "%#StInfoSep#" }
-- local left_red = { color = "%#StErr#", sep_color = "%#StErrSep#" }
local right_start_special = { color = "%#StInfo#", sep_color = "%#StSep2#" }
local st_err = { color = "%#StErr#", sep_color = "%#StErrSep#" }
local red_no_sep = { color = "%#ErrText#", no_sep = true }
local item_no_sep = { no_sep = true, color = "%#StatusLine#" }
local st_err_right = vim.tbl_extend("force", st_err, { side = "right" })
local st_warn = { color = "%#StWarn#", sep_color = "%#StWarnSep#", side = "right", no_after = true }
-- }}}
-- Format {{{
local function format_active()
  if vim.b.disable_autoformat and not vim.b.autoformat then
    return vim.tbl_extend("force", sec_2, { side = "right", no_before = false })
  end
  return vim.tbl_extend("force", st_mode, { side = "right", no_before = false })
end
-- }}}
-- Mode {{{
local function mode_highlight(mode)
  if mode == "i" then
    -- pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#83a598", fg = "#3c3836" })
    -- pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#83a598" })
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#2D4F67", fg = "#f3f3f3", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#2D4F67" })
  elseif vim.tbl_contains({ "v", "V", "" }, mode) then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#fe8019", fg = "#3c3836", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#fe8019" })
  elseif mode == "R" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#E46876", fg = "#3c3836", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#E46876" })
  elseif mode == "c" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#cba6f7", fg = "#3c3836", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#cba6f7" })
  elseif mode == "n" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#76946A", fg = "#3c3836", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#76946A" })
  elseif mode == "t" then
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#e82424", fg = "#3c3836", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#e82424" })
  else
    pcall(vim.api.nvim_set_hl, 0, "StMode", { bg = "#f3f3f3", fg = "#2D4F67", bold = true })
    pcall(vim.api.nvim_set_hl, 0, "StModeSep", { fg = "#f3f3f3", bg = "NONE" })
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
-- }}}
-- Git {{{
local function git_statusline()
  local result = {}
  if vim.b.gitsigns_head then
    table.insert(result, vim.b.gitsigns_head)
  elseif vim.g.gitsigns_head then
    table.insert(result, vim.g.gitsigns_head)
  end

  local signs = ""
  local status = ""
  local stats = {}
  if vim.b.gitsigns_status then
    local added = vim.b.gitsigns_status_dict.added
    local changed = vim.b.gitsigns_status_dict.changed
    local removed = vim.b.gitsigns_status_dict.removed
    if added and added > 0 then
      -- table.insert(stats, "%#StAdded# " .. tostring(added))
      table.insert(stats, "%#StAdded#A " .. tostring(added))
    end
    if changed and changed > 0 then
      -- table.insert(stats, "%#StChanged# " .. tostring(changed))
      table.insert(stats, "%#StChanged#M " .. tostring(changed))
    end
    if removed and removed > 0 then
      -- table.insert(stats, "%#StRemoved# " .. tostring(removed))
      table.insert(stats, "%#StRemoved#D " .. tostring(removed))
    end
  end

  if #result == 0 then
    status = ""
    signs = ""
  else
    status = with_icon(table.concat(result, " "), "")
    signs = table.concat(stats, " ")
  end
  return status, signs
end
-- }}}
-- Search {{{
local function search_result()
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
-- }}}
-- Diagnostics {{{
local function lsp_diagnostics()
  local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local items = {}

  if hint_count > 0 then
    table.insert(
      items,
      -- sep(" " .. hint_count, vim.tbl_extend("keep", { side = "right", no_after = false }, st_hint), hint_count > 0)
      sep("H " .. hint_count, vim.tbl_extend("keep", { side = "right", no_after = false }, st_hint), hint_count > 0)
    )
  end

  if info_count > 0 then
    table.insert(
      items,
      -- sep(" " .. info_count, vim.tbl_extend("keep", { side = "right", no_after = false }, st_info), info_count > 0)
      sep("I " .. info_count, vim.tbl_extend("keep", { side = "right", no_after = false }, st_info), info_count > 0)
    )
  end

  if err_count > 0 then
    table.insert(
      items,
      -- sep(" " .. err_count, vim.tbl_extend("keep", { no_after = false }, st_err_right), err_count > 0)
      sep("E " .. err_count, vim.tbl_extend("keep", { no_after = false }, st_err_right), err_count > 0)
    )
  end

  if warn_count > 0 then
    table.insert(
      items,
      -- sep(" " .. warn_count, vim.tbl_extend("keep", { no_after = false }, st_warn), warn_count > 0)
      sep("W " .. warn_count, vim.tbl_extend("keep", { no_after = false }, st_warn), warn_count > 0)
    )
  end

  return table.concat(items, "")
end
-- }}}
-- Modified {{{
local function get_modified_count()
  local bufnr = vim.api.nvim_get_current_buf()
  return #vim.tbl_filter(function(buf)
    return buf.listed
      and buf.changed
      and buf.bufnr ~= bufnr
      and vim.api.nvim_get_option_value("buftype", { buf = buf.bufnr }) ~= "terminal"
  end, vim.fn.getbufinfo({ bufmodified = 1, buflisted = 1, bufloaded = 1 }))
end
-- }}}
-- Lazy {{{
local function get_updates()
  local updates = require("lazy.status").has_updates()
  if updates == false then
    return ""
  end
  return "%#StSpecial#" .. require("lazy.status").updates()
end
-- }}}
-- Recording {{{
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end
-- }}}
-- Statusline {{{
local function statusline_active()
  -- local icon = require("mini.icons")
  local mode = mode_statusline()
  local branch, signs = git_statusline()
  local search = search_result()
  local db_ui = vim.g.loaded_dbui and vim.fn["db_ui#statusline"]() or ""
  -- with icon
  -- local ft = icon.get("extension", vim.bo.filetype) .. " " .. vim.bo.filetype:upper()
  -- without icon
  local ft = vim.bo.filetype:upper()
  local diagnostics = lsp_diagnostics()
  local modified_count = get_modified_count()
  local lazy = get_updates()
  local format = functions.format_enabled()
  local recording = show_macro_recording()

  local statusline_sections = {
    sep(mode, st_mode),
    sep(branch, sec_2, branch ~= ""),
    -- sep(functions.get_name(), left_red, functions.is_active()), -- hydra for multicursor
    -- sep(branch, sec_2, branch ~= ""), -- show branch after mode
    sep(signs, sec_2, signs ~= ""),
    sep(("+%d"):format(modified_count), st_err, modified_count > 0),
    -- sep(" - ", st_err, not vim.bo.modifiable),
    sep("%w", nil, vim.wo.previewwindow),
    sep("%r", nil, vim.bo.readonly),
    sep("%q", nil, vim.bo.buftype == "quickfix"),
    sep(db_ui, sec_2, db_ui ~= ""),
    "%<",
    "%=",
    sep("%t", vim.bo.modified and red_no_sep or item_no_sep), -- filename without path
    "%=",
    -- sep(lsp.message, vim.tbl_extend("keep", { side = "right" }, sec_2), lsp.message ~= ""),
    sep(recording, vim.tbl_extend("keep", { side = "right" }, st_err_right), recording ~= ""),
    sep(lazy, vim.tbl_extend("keep", { side = "right" }, right_start_special), lazy ~= ""),
    sep(search, vim.tbl_extend("keep", { side = "right" }, sec_2), search ~= ""),
    sep(ft, vim.tbl_extend("keep", { side = "right" }, sec_2), ft ~= ""),
    -- sep(" " .. os.date("%H:%M", os.time()), st_mode_right),
    diagnostics,
    -- sep("%4l:%-3c", st_mode_right),
    -- sep("%3p%%/%L", vim.tbl_extend("keep", { no_after = diagnostics == "" }, st_mode_right)),
    -- sep(format, format_active(), format ~= ""),
    sep(os.date("%H:%M", os.time()), vim.tbl_extend("keep", { no_after = true }, st_mode_right)),
    "%<",
  }

  return table.concat(statusline_sections, "")
end

local function statusline_inactive()
  return [[  %t %m %= %l:%c  ]]
end

function Statusline.setup()
  local focus = vim.g.statusline_winid == vim.fn.win_getid()
  local fts = { "neo-tree", "dashboard", "toggleterm" }

  if focus then
    for _, ft in ipairs(fts) do
      if vim.bo.filetype == ft then
        return ""
      end
    end
    return statusline_active()
  else
    return statusline_inactive()
  end
end

vim.o.statusline = "%!v:lua.require'settings.statusline'.setup()"

return Statusline
-- }}}
-- vim: foldmethod=marker foldlevel=0 foldmarker={{{,}}}
