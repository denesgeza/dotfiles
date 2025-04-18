local p = require("rose-pine.palette")

local bg_base = "NvimDarkGrey2"
local bg_b = "NvimDarkGrey3"
if Settings.transparency then
  bg_base = "NONE"
  bg_b = "NONE"
end
-- NOTE: See also lualine config for old colors
return {
  normal = {
    a = { bg = "NvimDarkCyan", fg = "NvimLightGrey3", gui = "bold" },
    -- b = { bg = p.overlay, fg = p.rose },
    b = { bg = bg_b, fg = "NvimLightGrey3" },
    c = { bg = bg_base, fg = p.text },
  },
  insert = {
    a = { bg = p.foam, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.foam },
    c = { bg = bg_base, fg = p.text },
  },
  visual = {
    a = { bg = p.iris, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.iris },
    c = { bg = bg_base, fg = p.text },
  },
  replace = {
    a = { bg = p.pine, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.pine },
    c = { bg = bg_base, fg = p.text },
  },
  command = {
    a = { bg = p.love, fg = p.base, gui = "bold" },
    b = { bg = p.overlay, fg = p.love },
    c = { bg = bg_base, fg = p.text },
  },
  inactive = {
    a = { bg = bg_base, fg = p.muted, gui = "bold" },
    b = { bg = bg_base, fg = p.muted },
    c = { bg = bg_base, fg = p.muted },
  },
  terminal = {
    a = { fg = "#383a42", bg = "#E46876" },
    b = { fg = "#383a42", bg = "#E46876" },
    c = { fg = "#383a42", bg = "#E46876" },
  },
}
