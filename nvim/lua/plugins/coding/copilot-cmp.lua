Is_Enabled = require("config.functions").is_enabled

return {
  "zbirenbaum/copilot-cmp",
  enabled = Is_Enabled("copilot-cmp"),
  opts = {
    fix_pairs = true,
  },
}
