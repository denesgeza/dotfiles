local M = {}

M = {
  transparency = true, ---@type boolean
  keyboard = "colemak", ---@type 'qwerty' | 'colemak'
  colorscheme = "default", ---@type 'default' | 'kanagawa'

  ---@type table<string>, { enabled: boolean, defaults: boolean }
  plugins = {
    ["autopairs"] = { enabled = true }, -- Not working
    ["bufferline"] = { enabled = true }, -- Not working
    ["conform"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["cmp-native-snippets"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["dadbod"] = { enabled = true },
    ["fidget"] = { enabled = true },
    ["flash"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["ibl"] = { enabled = true },
    ["lualine"] = { enabled = false }, -- Not setup
    ["mini-indentscope"] = { enabled = true },
    ["mini-hipatterns"] = { enabled = true },
    ["mini-files"] = { enabled = true },
    ["mini-bufremove"] = { enabled = true },
    ["neo-tree"] = { enabled = false },
    ["neorg"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["persistence"] = { enabled = true },
    ["trouble"] = { enabled = true }, -- V3 is not working
    ["todo-comments"] = { enabled = true },
    ["typescript-tools"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
    ["vim-visual-multi"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["telescope"] = { enabled = true },
  },
}
return M
