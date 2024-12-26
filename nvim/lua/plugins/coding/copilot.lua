return {
  "zbirenbaum/copilot.lua",
  enabled = Is_Enabled("copilot"),
  verylazy = true,
  cmd = "Copilot",
  build = ":Copilot auth",
  keymap = {
    accept = "<Tab>",
  },
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = false },
    -- filetypes = {
    --   markdown = true,
    --   help = true,
    --   lua = true,
    --   bash = true,
    -- },
  },
}
