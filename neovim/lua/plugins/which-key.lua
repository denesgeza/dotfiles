local Is_enabled = require("core.functions").is_enabled
return {
  "folke/which-key.nvim",
  enabled = Is_enabled("which-key"),
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = false,
        suggestions = 20,
      },
    },
    key_labels = {
      ["<tab>"] = "TAB",
      ["<Tab>"] = "TAB",
      ["<cr>"] = "ENTER",
      ["<space>"] = "SPACE",
    },
    window = {
      border = "single", ---@type "single" | "double" | "shadow" | "none"
      position = "bottom", ---@type "bottom" | "top"
      margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 0, 2, 0, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000, -- positive value to position WhichKey above other floating windows.      },
    },
    layout = {
      height = { min = 4, max = 6 }, -- min and max height of the columns
      width = { min = 20, max = 40 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "center", ---@type "left" | "center" | "right"
    },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "Surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "Tabs" },
      ["<leader>b"] = { name = "Buffer(s)" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>d"] = { name = "Debug" },
      ["<leader>D"] = { name = "Database" },
      ["<leader>f"] = { name = "Find" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>h"] = { name = "Harpoon" },
      ["<leader>q"] = { name = "Quit | Session" },
      ["<leader>o"] = { name = "Options" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>t"] = { name = "Term | Tests" },
      ["<leader>n"] = { name = "Neorg" },
      ["<leader>m"] = { name = "Copilot Chat" },
      ["<leader>u"] = { name = "UI" },
      ["<leader>w"] = { name = "Windows" },
      ["<leader>x"] = { name = "Diagnostics" },
      ["z"] = { name = "Folding" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
