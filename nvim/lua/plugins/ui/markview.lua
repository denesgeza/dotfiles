Is_Enabled = require("config.functions").is_enabled
return {
  "OXY2DEV/markview.nvim",
  enabled = Is_Enabled("markview"),
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
  },

  config = function()
    local presets = require("markview.presets").checkboxes

    require("markview").setup({
      checkboxes = presets.legacy,
      headings = presets.glow,
      highlight_groups = {
        {
          group_name = "markview_h1",
          value = { bg = "#453244", fg = "#f38ba8" },
        },
      },
      header = {
        {
          style = "padded_icon",

          line_hl = "markview_h1",

          -- This uses nerd font symbol by default and is therefore not shown here
          sign = "",
          sign_hl = "rainbow1",

          -- This uses nerd font symbol by default and is therefore not shown here
          icon = "",
          icon_hl = "markview_h1_icon",
          icon_width = 1,
        },
      },
    })
  end,
}
