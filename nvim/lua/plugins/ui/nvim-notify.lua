Is_Enabled = require("config.functions").is_enabled

return {
  "rcarriga/nvim-notify",
  enabled = Is_Enabled("nvim-notify") and Manager.notifications == "nvim-notify",
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
      "<leader>un",
      "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
      desc = "Notifications",
    },
  },
}
