return {
  {
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
          accept = "<Tab>",
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
  },
  -- Disable the default copilot completion from lazyvim
  {
    "giuxtaposition/blink-cmp-copilot",
    enabled = false,
  },
  {
    "fang2hou/blink-copilot",
    enabled = Is_Enabled("blink-copilot"),
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 800,
            async = true,
            opts = {
              max_completions = 3,
              max_attempts = 4,
            },
          },
        },
      },
    },
  },
}
