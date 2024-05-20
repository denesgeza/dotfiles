local M = {}
-- {{{ Toggle terminals

M.float = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ direction = "float" })
  return t:toggle()
end

M.horizontal = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ direction = "horizontal", size = 12 })
  return t:toggle()
end

M.vertical = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ dir = "git_dir", direction = "vertical", size = 40, name = "Term" })
  return t:toggle()
end

M.tab = function()
  local Terminal = require("toggleterm.terminal").Terminal
  -- local t = Terminal:new({ dir = "~/Desktop", direction = "tab", size = 40 })
  local t = Terminal:new({ direction = "tab", size = 40 })
  return t:toggle()
end

M.lazygit = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ cmd = "lazygit", direction = "float" })
  return t:toggle()
end

M.ranger = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ cmd = "ranger", direction = "float" })
  return t:toggle()
end

M.python = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ cmd = "python3", hidden = true })
  return t:toggle()
end

M.node = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ cmd = "node", hidden = true })
  return t:toggle()
end

M.btop = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local t = Terminal:new({ cmd = "btop", hidden = true, direction = "float" })
  return t:toggle()
end

return M
