local M = {}

M = {
  transparency = true, ---@type boolean
  keyboard = "colemak", ---@type 'qwerty' | 'colemak'
  colorscheme = "default", ---@type 'default' | 'kanagawa' | 'cyberdream'
  cmp = "luasnip", ---@type 'luasnip' | 'native'

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
    ["mini-bufremove"] = { enabled = true },
    ["mini-files"] = { enabled = true },
    ["mini-pairs"] = { enabled = true },
    ["neo-tree"] = { enabled = true }, -- not working corectly
    ["nvim-surround"] = { enabled = true },
    ["telescope"] = { enabled = true },
    ["vim-visual-multi"] = { enabled = true },
    ["which-key"] = { enabled = true },
    -- Colorscheme
    ["cyberdream"] = { enabled = true },
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
    ["noice"] = { enabled = true },
    ["nui"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
  },
}
return M
