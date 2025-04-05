return {
  "zbirenbaum/copilot.lua",
  enabled = Is_Enabled("copilot"),
  verylazy = true,
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
      },
    },
    panel = { enabled = false },
    -- filetypes = {
    --   markdown = true,
    --   help = true,
    --   lua = true,
    --   bash = true,
    -- },
  },
}
