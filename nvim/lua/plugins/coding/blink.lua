return {
  "saghen/blink.cmp",
  enabled = Manager.completion == "blink",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    windows = {
      autocomplete = {
        min_width = 40,
        winblend = vim.o.pumblend,
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        selection = "preselect", ---@type 'preselect' | 'manual' | 'auto_insert'
        border = "single", ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'
      },
      documentation = {
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None",
        auto_show = true,
        border = "single", ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'
      },
      signature_help = {
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None",
        border = "single", ---@type 'single' | 'double' | 'padded' | 'solid' | 'shadow' | 'none'
      },
      ghost_text = { enabled = false }, -- it is already used for copilot
    },
    -- experimental auto-brackets support
    accept = {
      auto_brackets = {
        enabled = true,
        default_brackets = { "(", ")" },
        override_brackets_for_filetypes = {
          tex = { "{", "}" },
        },
      },
    },

    -- experimental signature help support
    trigger = {
      completion = {
        show_in_snippet = true,
      },
      signature_help = { enabled = true },
    },
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      preset = "enter", ---@type 'enter' | 'default' | 'super-tab'
    },
    kind_icons = LazyVim.config.icons.kinds,
  },
}
