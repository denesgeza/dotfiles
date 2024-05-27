Is_enabled = require("core.functions").is_enabled

return {
  {
    "zbirenbaum/copilot.lua",
    enabled = Is_enabled("copilot"),
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<C-;>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "right", ---@type 'top'|'bottom'|'left'|'right'
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = false, -- set to true to show ghost text and disable in cmp
        debounce = 75,
        auto_trigger = true,
        keymap = {
          accept = "<C-;>",
          next = "<C-.>", -- Option + ]
          prev = "<C-,>",
          dismiss = "/",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        html = false,
        htmldjango = false,
        norg = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = Is_enabled("copilot"),
    opts = {
      fix_pairs = true,
    },
  },
}
