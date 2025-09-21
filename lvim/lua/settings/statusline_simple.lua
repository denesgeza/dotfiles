-- Credits to: https://github.com/rjshkhr/dotfiles/blob/main/.config/nvim/lua/config/statusline.lua
---------------------------------------------------------------------------------------------------
local Statusline = {}

local colors = {
  bg = { gui = "#1D2326", cterm = 0 },
  fg = { gui = "#E6E7E6", cterm = 7 },
  black = { gui = "#242B2D", cterm = 0 },
  black_bright = { gui = "#485457", cterm = 8 },
  red = { gui = "#BC8F7D", cterm = 1 },
  red_bright = { gui = "#D4A394", cterm = 9 },
  green = { gui = "#96B088", cterm = 2 },
  green_bright = { gui = "#ABC49E", cterm = 10 },
  yellow = { gui = "#CCAC7D", cterm = 3 },
  yellow_bright = { gui = "#E2BF8F", cterm = 11 },
  blue = { gui = "#7E9AAB", cterm = 4 },
  blue_bright = { gui = "#94B1C4", cterm = 12 },
  magenta = { gui = "#A68CAA", cterm = 5 },
  magenta_bright = { gui = "#BC9EC0", cterm = 13 },
  cyan = { gui = "#839C98", cterm = 6 },
  cyan_bright = { gui = "#97B3AF", cterm = 14 },
  white = { gui = "#CED3DC", cterm = 7 },
  white_bright = { gui = "#E8EBF0", cterm = 15 },
}

local highlights = {
  StatusLineMode = { fg = colors.blue.gui, ctermfg = colors.blue.cterm }, -- Mode indicator
  StatusLinePath = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- File path
  StatusLineFlags = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- File flags
  StatusLineFileType = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- File type
  StatusLinePosition = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm }, -- Line and column
  StatusLinePercent = { fg = colors.green.gui, ctermfg = colors.green.cterm }, -- Percentage
  StatusLineModified = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Color for modified icon

  StatusLineModeNormal = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
  StatusLineModeInsert = { fg = colors.green.gui, ctermfg = colors.green.cterm },
  StatusLineModeVisual = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
  StatusLineModeCommand = { fg = colors.green.gui, ctermfg = colors.green.cterm },
  StatusLineModeReplace = { fg = colors.red.gui, ctermfg = colors.red.cterm },
  StatusLineModeTerminal = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
}

local function set_highlights()
  for group, props in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, props)
  end
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

local mode_colors = {
  n = "StatusLineModeNormal",
  i = "StatusLineModeInsert",
  v = "StatusLineModeVisual",
  [""] = "StatusLineModeVisual",
  V = "StatusLineModeVisual",
  c = "StatusLineModeCommand",
  R = "StatusLineModeReplace",
  t = "StatusLineModeTerminal",
  ["^V"] = "StatusLineModeVisual",
}

local mode_names = {
  ["^V"] = "V-BLOCK",
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL-LINE",
  [""] = "VISUAL-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local filetype_icons = {
  ["typescript"] = "",
  ["javascript"] = "",
  ["javascriptreact"] = "",
  ["typescriptreact"] = "",
  ["svelte"] = "",
  ["python"] = "",
  ["java"] = "",
  ["html"] = "",
  ["htmldjango"] = "",
  ["css"] = "",
  ["scss"] = "",
  ["php"] = "",
  ["kotlin"] = "",
  ["markdown"] = "",
  ["sh"] = "",
  ["zsh"] = "",
  ["vim"] = "",
  ["rust"] = "",
  ["c"] = "",
  ["cpp"] = "",
  ["cs"] = "",
  ["go"] = "",
  ["lua"] = "",
  ["conf"] = "",
  ["haskell"] = "",
  ["ruby"] = "",
}

local function get_filetype_icon()
  local ft = vim.bo.filetype
  return filetype_icons[ft] or " "
end

local function get_mode()
  -- local mode = vim.api.nvim_get_mode().mode
  local mode = vim.fn.mode()
  return "%#" .. (mode_colors[mode] or "StatusLineModeNormal") .. "#"
end

local function get_mode_name()
  local mode = vim.api.nvim_get_mode().mode
  return mode_names[mode] or mode
end

local function diagnostics()
  local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local items = {}
  if err_count > 0 then
    table.insert(items, "%#DiagnosticError# " .. "E" .. err_count)
  end
  if warn_count > 0 then
    table.insert(items, "%#DiagnosticWarn# " .. "W" .. warn_count)
  end
  if hint_count > 0 then
    table.insert(items, "%#DiagnosticHint# " .. "H" .. hint_count)
  end
  if info_count > 0 then
    table.insert(items, "%#DiagnosticInfo# " .. "I" .. info_count)
  end
  return table.concat(items, " ")
end
local function get_modified()
  if vim.bo.modified then
    return ""
  end
  return ""
end

function Statusline.active()
  set_highlights()
  local mode = get_mode()
  local mode_name = get_mode_name()
  local diagnostics_info = diagnostics()
  local modified = get_modified()
  local filetype_icon = get_filetype_icon()
  local modified_count = get_modified_count()
  local sections = {
    " ",
    mode,
    mode_name,
    diagnostics_info,
    "%=",
    "%#StatusLinePath#",
    " %t ", -- Absolute path %f, Relative path %t
    "%#StatusLineModified#",
    modified,
    "%#DiagnosticError#",
    modified_count > 0 and " +" .. modified_count or "",
    "%#StatusLineFlags#",
    "%r%h%w",
    "%=",
    "%#StatusLineFileType#",
    filetype_icon,
    " %{&filetype} ",
    "%#StatusLinePosition#",
    " %l:%c ",
    " ",
  }
  return table.concat(sections)
end

vim.o.statusline = "%!v:lua.require'settings.statusline_simple'.active()"

return Statusline
