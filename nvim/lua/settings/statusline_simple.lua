local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
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
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s", modes[current_mode]):upper()
end
local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "n" then
    mode_color = "%#StAdded#"
  elseif current_mode == "i" or current_mode == "ic" then
    mode_color = "%#CmpItemKindFunction#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    mode_color = "%#StWarn#"
  elseif current_mode == "R" then
    mode_color = "%#CmpItemMenu#"
  elseif current_mode == "c" then
    mode_color = "%#CmpItemKindField#"
  elseif current_mode == "t" then
    mode_color = "%#CmpItemAbbrMatch#"
  end
  return mode_color
end

local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    -- errors = " %#SLDiagErr#E " .. count["errors"]
    errors = " E " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    -- warnings = " %#SLDiagWarn#W " .. count["warnings"]
    warnings = " W " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    -- hints = " %#SLDiagHint#H " .. count["hints"]
    hints = " H " .. count["hints"]
  end
  if count["info"] ~= 0 then
    -- info = " %#SLDiagInfo#I " .. count["info"]
    info = " I " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#StatusLine#"
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
  if vim.bo.filetype == "Dashboard" then
    return ""
  end
  return " %P %l:%c "
end

local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  -- with colors
  -- local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  -- local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  -- local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  -- wo colors
  -- local added = git_info.added and ("+" .. git_info.added .. " ") or ""
  -- local changed = git_info.changed and ("~" .. git_info.changed .. " ") or ""
  -- local removed = git_info.removed and ("-" .. git_info.removed .. " ") or ""
  -- if git_info.added == 0 then
  --   added = ""
  -- end
  -- if git_info.changed == 0 then
  --   changed = ""
  -- end
  -- if git_info.removed == 0 then
  --   removed = ""
  -- end

  return table.concat({
    " ",
    " ",
    git_info.head,
    " ",
    -- added,
    -- changed,
    -- removed,
    " ",
    "%#StatusLine#",
  })
end

local Statusline = {}

function Statusline.active()
  if vim.g.colors_name == "default" then
    if vim.bo.modified then
      vim.cmd("hi StatusLine guifg=#000000 guibg=#7DC4E4 gui=bold")
    else
      if vim.o.background == "light" then
        vim.cmd("hi StatusLine cterm=reverse guifg=NvimLightGrey3 guibg=NvimDarkGrey3 gui=bold")
      else
        vim.cmd("hi StatusLine cterm=reverse guifg=NvimDarkGrey3 guibg=NvimLightGrey3 gui=bold")
      end
    end
  end
  return table.concat({
    "%#StatusLine#",
    update_mode_colors(),
    mode(),
    vcs(),
    -- "%#Normal# ",
    -- filepath(),
    "%<",
    "%=",
    filename(),
    "%=",
    "%#Statusline#",
    lsp(),
    filetype(),
    -- lineinfo(),
  })
end

function Statusline.simple()
  return table.concat({
    -- "%#StatusLine#",
    "%<",
    "%=",
    filetype(),
    "%=",
  })
end

function Statusline.inactive()
  return [[  %t %m %= %l:%c ]]
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
    return Statusline.active()
  else
    return Statusline.inactive()
  end
end

return Statusline
