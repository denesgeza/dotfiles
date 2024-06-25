Is_Enabled = require("config.functions").is_enabled

return {
  "echasnovski/mini.clue",
  enabled = Is_Enabled("mini.clue"),
  version = false,
  lazy = false,
  opts = {},
  config = function()
    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<Leader>b", desc = "+buffers" },
        { mode = "n", keys = "<leader>c", desc = "+code" },
        { mode = "n", keys = "<leader>D", desc = "+database" },
        { mode = "n", keys = "<leader>g", desc = "+git" },
        { mode = "n", keys = "<leader>n", desc = "+neorg/noice" },
        { mode = "n", keys = "<leader>o", desc = "+options" },
        { mode = "n", keys = "<leader>s", desc = "+search" },
        { mode = "n", keys = "<leader><Tab>", desc = "+tab" },
        { mode = "n", keys = "<leader>q", desc = "+quit" },
        { mode = "n", keys = "<leader>u", desc = "+ui" },
        { mode = "n", keys = "<leader>w", desc = "+window" },
        { mode = "n", keys = "<leader>x", desc = "+diagnostics" },
      },
    })
  end,
}
