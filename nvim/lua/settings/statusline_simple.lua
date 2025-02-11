-- Credits to: https://github.com/rjshkhr/dotfiles/blob/main/.config/nvim/lua/config/statusline.lua
---------------------------------------------------------------------------------------------------
local H = {}

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
  -- n = "NORMAL",
  -- i = "INSERT",
  -- v = "VISUAL",
  -- [""] = "V-BLOCK",
  -- V = "V-LINE",
  -- c = "COMMAND",
  -- R = "REPLACE",
  -- t = "TERMINAL",
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
  local mode = vim.api.nvim_get_mode().mode
  return "%#" .. (mode_colors[mode] or "StatusLineModeNormal") .. "#"
end

local function get_mode_name()
  local mode = vim.api.nvim_get_mode().mode
  return mode_names[mode] or mode
end

local function get_modified()
  if vim.bo.modified then
    return ""
  end
  return ""
end

local statusline = table.concat({
  " ",
  get_mode(),
  get_mode_name(),
  "%#StatusLinePath#",
  " %f ",
  "%#StatusLineModified#",
  get_modified(),
  "%#StatusLineFlags#",
  "%r%h%w",
  "%=",
  "%#StatusLineFileType#",
  get_filetype_icon(),
  " %{&filetype} ",
  "%#StatusLinePosition#",
  " %l:%c ",
  " ",
})

function H.setup()
  return statusline
end

return H
