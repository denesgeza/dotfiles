Is_enabled = require("core.functions").is_enabled
-- {{{ notify
return {
  "rcarriga/nvim-notify",
  enabled = Is_enabled("notify"),
  opts = {
    background_colour = "#1A1B26",
    timeout = 5000,
    top_down = true,
    level = 2,
    minimum_width = 50,
    render = "compact", ---@type "default" | "minimal" | "compact" | "simple" | "wrapped-compact"
    stages = "fade_in_slide_out",
  },
  keys = {
    {
      mode = { "n" },
      "<leader>fN",
      "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
      desc = "Notifications",
    },
  },
}
-- }}}
