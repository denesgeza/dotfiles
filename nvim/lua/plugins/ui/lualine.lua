Manager = require("config.manager")
local functions = require("config.functions")
return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter", "BufReadPost", "BufNewFile" },
  enabled = Manager.statusline == "lualine",
  opts = function(_, opts)
    local theme_colors = require("settings.theme")
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
