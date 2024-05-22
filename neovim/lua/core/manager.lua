local M = {}

M = {
  transparency = true, ---@type boolean
  keyboard = "colemak", ---@type 'qwerty' | 'colemak'
  colorscheme = "default", ---@type 'default' | 'kanagawa' | 'cyberdream'
  cmp = "native", ---@type 'luasnip' | 'native'
  statusline = "lualine", ---@type 'lualine'

  ---@type table<string>, { enabled: boolean, defaults: boolean }
  plugins = {
    ["copilot"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true },
    ["dadbod"] = { enabled = true },
    ["neorg"] = { enabled = true },
    ["persistence"] = { enabled = true },
    ["todo-comments"] = { enabled = true },
    ["toggleterm"] = { enabled = false },
    -- LSP
    ["conform"] = { enabled = true },
    ["mini-ai"] = { enabled = false },
    ["nvim-lint"] = { enabled = false },
    ["typescript-tools"] = { enabled = true },
    ["trouble"] = { enabled = true }, -- V3 is not working
    -- Editor
    ["bufferline"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["lualine"] = { enabled = false },
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
    ["cyberdream"] = { enabled = false },
    ["kanagawa"] = { enabled = false },
    -- Testing
    ["neotest"] = { enabled = true },
    -- UI
    ["dressing"] = { enabled = true },
    ["fidget"] = { enabled = false },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["ibl"] = { enabled = true },
    ["mini-animate"] = { enabled = true },
    ["mini-indentscope"] = { enabled = true },
    ["mini-hipatterns"] = { enabled = true },
    ["notify"] = { enabled = false },
    ["noice"] = { enabled = true },
    ["nui"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
  },
}
return M
