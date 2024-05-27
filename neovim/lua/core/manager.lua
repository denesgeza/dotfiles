local M = {}

M = {
  transparency = true, ---@type boolean
  keyboard = "colemak", ---@type 'qwerty' | 'colemak'
  colorscheme = "default", ---@type 'default' | 'kanagawa' | 'cyberdream'
  cmp = "luasnip", ---@type 'luasnip' | 'native'
  statusline = "lualine", ---@type 'lualine'

  ---@type table<string>, { enabled: boolean, defaults: boolean }
  plugins = {
    -- Coding
    ["copilot"] = { enabled = true },
    ["copilot-chat"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true },
    -- Other
    ["dadbod"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["persistence"] = { enabled = true },
    ["todo-comments"] = { enabled = true },
    ["toggleterm"] = { enabled = false },
    ["venv-select"] = { enabled = false },
    -- LSP
    ["conform"] = { enabled = true },
    ["mini-ai"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["typescript-tools"] = { enabled = true },
    ["trouble"] = { enabled = true },
    -- Editor
    ["bufferline"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["lualine"] = { enabled = M.statusline == "lualine" },
    ["mini-files"] = { enabled = true },
    ["mini-pairs"] = { enabled = true },
    ["neo-tree"] = { enabled = true }, -- not working correctly
    ["nvim-surround"] = { enabled = true },
    ["telescope"] = { enabled = true },
    ["ts-comments"] = { enabled = true },
    ["vim-visual-multi"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["neogit"] = { enabled = true },
    -- Colorscheme
    ["cyberdream"] = { enabled = true },
    ["kanagawa"] = { enabled = true },
    ["rose-pine"] = { enabled = true },
    -- Testing
    ["neotest"] = { enabled = true },
    -- UI
    ["dressing"] = { enabled = true },
    ["fidget"] = { enabled = true },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["ibl"] = { enabled = true },
    ["mini-animate"] = { enabled = true },
    ["mini-indentscope"] = { enabled = true },
    ["mini-hipatterns"] = { enabled = true },
    ["notify"] = { enabled = false },
    ["noice"] = { enabled = false },
    ["nui"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
    ["zen-mode"] = { enabled = true },
  },
}
return M
