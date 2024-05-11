local M = {}

M = {
  transparency = true, ---@type boolean
  keyboard = "colemak", ---@type 'qwerty' | 'colemak'
  colorscheme = "default", ---@type 'default' | 'kanagawa' | 'cyberdream'

  ---@type table<string>, { enabled: boolean, defaults: boolean }
  plugins = {
    ["bufferline"] = { enabled = true },
    ["conform"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = false }, -- false to enable luasnip
    ["cyberdream"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["dadbod"] = { enabled = true },
    ["fidget"] = { enabled = false },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["ibl"] = { enabled = true },
    ["lualine"] = { enabled = false },
    ["mini-ai"] = { enabled = false },
    ["mini-indentscope"] = { enabled = true },
    ["mini-hipatterns"] = { enabled = true },
    ["mini-files"] = { enabled = true },
    ["mini-bufremove"] = { enabled = true },
    ["mini-pairs"] = { enabled = true },
    ["neo-tree"] = { enabled = true }, -- not working corectly
    ["neorg"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["noice"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["persistence"] = { enabled = true },
    ["trouble"] = { enabled = true }, -- V3 is not working
    ["todo-comments"] = { enabled = true },
    ["toggleterm"] = { enabled = true },
    ["typescript-tools"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
    ["vim-visual-multi"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["telescope"] = { enabled = true },
  },
}
return M
