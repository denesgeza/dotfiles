local functions = require("config.functions")
local theme_colors = {
  normal = {
    a = { fg = "#f3f3f3", bg = "#2D4F67" },
    b = { fg = "#b8c0e0", bg = "#45475a" },
    c = { fg = "#f3f3f3", bg = "NONE" },
    x = { fg = "#f3f3f3", bg = "NONE" },
    y = { fg = "#f3f3f3", bg = "#383a42" },
    z = { fg = "#f3f3f3", bg = "#2D4F67" },
  },
  insert = {
    a = { fg = "#383a42", bg = "#91d7e3" },
    b = { fg = "#383a42", bg = "#91d7e3" },
    c = { fg = "#f3f3f3", bg = "#45475a" },
  },
  visual = {
    a = { fg = "#383a42", bg = "#f2cdcd" },
    b = { fg = "#383a42", bg = "#f2cdcd" },
    c = { fg = "#f3f3f3", bg = "#45475a" },
  },
  replace = {
    a = { fg = "#383a42", bg = "#E46876" },
    b = { fg = "#383a42", bg = "#E46876" },
    c = { fg = "#f3f3f3", bg = "#45475a" },
  },
  command = {
    a = { fg = "#383a42", bg = "#fab387" },
    b = { fg = "#383a42", bg = "#fab387" },
    c = { fg = "#f3f3f3", bg = "#45475a" },
  },
  terminal = {
    a = { fg = "#383a42", bg = "#E46876" },
    b = { fg = "#383a42", bg = "#E46876" },
    c = { fg = "#383a42", bg = "#E46876" },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter", "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled("lualine"),
  opts = function(_, opts)
    vim.cmd("hi StatusLine cterm=reverse guifg=NvimDarkGrey3 guibg=NvimLightGrey4")

    if Use_Defaults("lualine") then
      opts = opts
    else
      opts = opts
      opts.options = {
        -- theme = "auto", ---@type table | "auto" -- auto will use the theme that the colorscheme is using
        theme = theme_colors, ---@type table | "auto" -- auto will use the theme that the colorscheme is using
        globalstatus = true, ---@type boolean -- show statusline in all windows or only in the active window
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      }
      opts.sections.lualine_b = { { "branch", icon = "" }, functions.modified }
      opts.sections.lualine_y = {
        -- { functions.get_name, cond = functions.is_active }, -- multicursor plugin
        functions.search_result,
        -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 1, right = 1 } },
        functions.format_enabled,
      }
    end
  end,
}
