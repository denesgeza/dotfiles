local M = {}

M = {
  transparency = true, ---@type boolean
  keyboard = "colemak", ---@type 'qwerty' | 'colemak'
  colorscheme = "default", ---@type 'default' | 'kanagawa'

  ---@type table<string>, { enabled: boolean, defaults: boolean }
  plugins = {
    ["bufferline"] = { enabled = true }, -- Not working
    ["conform"] = { enabled = true },
    ["copilot"] = { enabled = true },
    ["dashboard"] = { enabled = true },
    ["gitsigns"] = { enabled = true },
    ["ibl"] = { enabled = true },
    ["luasnip"] = { enabled = false },
    ["lualine"] = { enabled = false }, -- Not setup
    ["mini-indentscope"] = { enabled = true },
    ["mini-bufremove"] = { enabled = true },
    ["neo-tree"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = true },
    ["nvim-surround"] = { enabled = true },
    ["nvim-lint"] = { enabled = false },
    ["persistence"] = { enabled = true },
    ["trouble"] = { enabled = true }, -- V3 is not working
    ["todo-comments"] = { enabled = true },
    ["typescript-tools"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
    ["which-key"] = { enabled = true },
    ["telescope"] = { enabled = true },
  },
}
return M
